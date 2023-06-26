// Auth APIs
const String GET_NEW_ACCESS_TOKEN = '/token';
const String REGISTRATION = '/patient/register/';
const String LOGIN = '/login';

// Patient APIs
const String Add_Patient_FUID ='/patient/fuid/add';
const String Get_Patient_Profile = '/patient/get/';
const String Get_Doctors = '/patient/getDoctors';
const String Add_Symptom = '/patient/symptom/add';
const String Edit_Patient_profile = '/patient/edit';
const String Get_Symptoms = '/patient/symptom/getAll';
const String DELETE_SYMPTOM = '/patient/symptom/delete';
const String SEARCH_DOCTOR_BY_NAME = '/doctor/search';

// Doctor APIs
const String Add_Doctor_FUID = '/doctor/fuid/add';
const String Edit_Doctor_Profile = '/doctor/editProfile';
const String Get_Doctor_Profile = '/doctor/get/';
const String ASSIGN_PATIENT_TO_DOCTOR = '/doctor/assignPatient';
const String GET_DOCTOR_PATIENTS = '/doctor/getDoctorPatients/';
const String ADD_NOTE_TO_PATIENT = '/doctor/addNote';
const String GET_PATIENT_NOTES = '/doctor/getNote';
const String SEARCH_DOCTOR_PATIENT = '/doctor/searchDoctorPatients';
const String ADD_VIDEO = '/doctor/addVideo';
const String GET_ALL_VIDEOS = '/doctor/getAllVideos/';

const String ADMIN_LOGIN = '/admin/login';
const String ADMIN_GET_ALL_DOCTORS = '/admin/doctor/getAll';
const String ADMIN_GET_SPECIFICDOCTOR = '/admin/doctor/get/2';
const String ADMIN_ADD_NEW_DOCTOR = '/admin/doctor/add';

