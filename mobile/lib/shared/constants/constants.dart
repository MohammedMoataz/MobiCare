import '../../models/doctor_model.dart';
import '../../models/patient_model.dart';

String ? uId;
String ? accessToken;
String ? refreshToken;
String ? role;
PatientModel ? asPatientModel;
DoctorModel ? asDoctorModel;

const String bridge = "https://bridge.walletconnect.org";
const String contractName = "EHR";
const String sepoliaContractAddress = "0x43b4A2D7Fe18F7F7d9B23D187169442325bDD772";
const String projectId = "bbb670a50c47402b960dbe6c0ecf8230";
const String rpcURL = "https://sepolia.infura.io/v3/bbb670a50c47402b960dbe6c0ecf8230";
const String wsURL = "wss://sepolia.infura.io/ws/v3/bbb670a50c47402b960dbe6c0ecf8230";

const walletName = "MetaMask";
const walletDescription = "MetaMask Wallet";
const walletURL = "https://metamask.io/";
const walletIcon = "https://github.com/HebaAdelAhmed/MobiCare/blob/moataz/assets/metamask.png?raw=true";

const web3StorageToken = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJkaWQ6ZXRocjoweGU4MmZBMDJCMzYxMjVBNTc2ZEExZTkyNERiODJEZjMxM2RDMTIzNDIiLCJpc3MiOiJ3ZWIzLXN0b3JhZ2UiLCJpYXQiOjE2ODE2MjQ4NDQ0MDUsIm5hbWUiOiJNb2JpQ2FyZSJ9._Mkp4-eM6npwJywDr0W4qq2SVm9lyKVtipin5ek6fGg";