import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web3dart/web3dart.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../shared/network/remote/web3.dart';
import '../../../../shared/network/remote/web3_dio_helper.dart';
import 'states.dart';

class PrescriptionCubit extends Cubit<PrescriptionStates> {
  PrescriptionCubit() : super(PrescriptionInitialState());

  static PrescriptionCubit get(BuildContext context) =>
      BlocProvider.of(context);

  final connector = BlockchainConnection.connector;
  EthereumAddress? senderAddress;
  dynamic session;

  late List<dynamic> records = [];
  List<File> files = [];

  blockchainSetup() async => await BlockchainConnection.initialSetup();

  changeSession(dynamic newSession) {
    session = newSession;
    print("session: $session");
  }

  Future<void> connectMetaMaskWallet(BuildContext context) async {
    senderAddress = await BlockchainConnection.connectMetaMaskWallet(context);
    emit(GetSenderAddressState());
  }

  Future<void> addRecord(
      String cid, String fileName, String patientAddress) async {
    try {
      EthereumAddress address = EthereumAddress.fromHex(patientAddress);
      await BlockchainConnection.addRecord(cid, fileName, address);
    } catch (err) {
      print("addRecord err: $err");
    }
  }

  Future<List> getRecords(String patientAddress) async {
    // Getting the current record declared in the smart contract.
    EthereumAddress address = EthereumAddress.fromHex(patientAddress);
    records = await BlockchainConnection.getRecords(address);

    emit(GetRecordsState());
    return records;
  }

  getMedicalRecords(List<dynamic> records) async {
    if (records.isNotEmpty) {
      for (var record in records) {
        Web3DioHelper.getData(param: record[0])
            .then((value) async {
          var fileBytes = value.data
              .replaceAll('[', '')
              .replaceAll(']', '')
              .split(',')
              .map<int>((e) => int.parse(e))
              .toList();

          Directory appDocDirectory =
          await getApplicationDocumentsDirectory();

          Directory('${appDocDirectory.path}/dir')
              .create(recursive: true)
              .then((Directory directory) {
            print(
                'Path of New Dir: ${directory.path}');
            String appDocPath = directory.path;

            // Create a file object with the desired save path
            File file =
            File('$appDocPath/${record[1]}');

            file.writeAsBytes(fileBytes);
            files.add(file);

            emit(GetMedicalRecordState());
          });
        }).catchError((err) => print(err));
      }
    }
  }
}
