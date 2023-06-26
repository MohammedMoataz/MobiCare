import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:walletconnect_dart/walletconnect_dart.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

import '../../constants/constants.dart';

class BlockchainConnection {
  static final Web3Client client =
      Web3Client(rpcURL, Client(), socketConnector: () {
    return IOWebSocketChannel.connect(wsURL).cast<String>();
  });

  static final EthereumAddress contractAddress =
      EthereumAddress.fromHex(sepoliaContractAddress);

  static final connector = WalletConnect(
    bridge: bridge,
    clientMeta: const PeerMeta(
      name: walletName,
      description: walletDescription,
      url: walletURL,
      icons: [walletIcon],
    ),
  );

  static late DeployedContract deployedContract;
  static late ContractFunction _addRecord;
  static late ContractFunction _getRecords;

  static late EthereumAddress senderAddress;
  static late Credentials credentials;
  static late EtherAmount amount;
  static late EthereumWalletConnectProvider provider;

  static List<dynamic> records = [];

  static dynamic session;

  static initialSetup() async {
    // establish a connection to the ethereum rpc node. The socketConnector
    // property allows more efficient event streams over websockets instead of
    // http-polls. However, the socketConnector property is experimental.

    await getAbi();
  }

  static Future<void> getAbi() async {
    // Reading the contract abi
    await rootBundle.loadString("contracts/EHR.json").then((value) async {
      dynamic jsonAbi = await jsonDecode(value);
      String abiCode = jsonEncode(jsonAbi["abi"]);

      getDeployedContract(abiCode);
    });
  }

  static getDeployedContract(String abiCode) {
    // Telling Web3dart where our contract is declared.
    deployedContract = DeployedContract(
        ContractAbi.fromJson(abiCode, contractName), contractAddress);

    // Extracting the functions, declared in contract.
    _addRecord = deployedContract.function("addRecord");
    _getRecords = deployedContract.function("getRecords");
  }

  static changeSession(dynamic newSession) {
    session = newSession;
    print("session: $session");
  }

  static connectorEvents() {
    connector.on('connect', (session) => changeSession(session));
    connector.on('session_update', (payload) => changeSession(payload));
    connector.on('disconnect', (session) => changeSession(session));
  }

  static Future<EthereumAddress?> connectMetaMaskWallet(
      BuildContext context) async {
    connectorEvents();

    if (!connector.connected) {
      try {
        session = await connector.createSession(
          onDisplayUri: (uri) async {
            await launchUrlString(uri, mode: LaunchMode.externalApplication);

            String privateKey = uri.split('=')[2];
            credentials = EthPrivateKey.fromHex(privateKey);
          },
        );
        senderAddress = EthereumAddress.fromHex(session.accounts[0]);

        await getCredentials();

        return senderAddress;
      } catch (error) {
        print("error while connecting to the wallet $error");
      }
    }
    return null;
  }

  static getCredentials() async {
    amount = await client.getBalance(senderAddress);
    print("Amount: $amount");

    provider = EthereumWalletConnectProvider(connector);
  }

  static Future<void> addRecord(
      String cid, String fileName, EthereumAddress? patientAddress) async {
    try {
      print(provider.chainId);

      List<dynamic> params = [cid, fileName, patientAddress];
      print({"params": params});

      final gas = await client.estimateGas(
        sender: senderAddress,
        to: contractAddress,
        data: _addRecord.encodeCall(params),
      );
      print("gas: $gas");

      final gasPrice = EtherAmount.inWei(BigInt.from(1330691571697097836));
      const maxGas = 265627;

      String txHash = await client.sendTransaction(
        credentials,
        Transaction.callContract(
          contract: deployedContract,
          function: _addRecord,
          parameters: params,
          from: senderAddress,
          gasPrice: gasPrice,
          maxGas: maxGas,
        ),
        chainId: 11155111,
      );
      print("tx hash: $txHash");
    } catch (err) {
      print("addRecord error: $err");
    }
  }

  static Future<List> getRecords(EthereumAddress patientAddress) async {
    // Getting the current record declared in the smart contract.
    records = await client.call(
      contract: deployedContract,
      function: _getRecords,
      params: [patientAddress],
    );

    records = records[0];
    return records;
  }
}
