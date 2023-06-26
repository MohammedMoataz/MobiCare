const router = require("express").Router()
const DoctorController = require('../controller/doctor.controller')
const PatientController = require('../controller/patient.controller')
const authController = require('../controller/auth.controller')

const adminMiddleware = require('../middlewares/adminAuth.middleware')

// Doctor Routes
router.post('/doctor/add', adminMiddleware, DoctorController.addDoctor)
router.patch('/doctor/edit/:id', adminMiddleware, DoctorController.editDoctor)
router.get('/doctor/getAll', adminMiddleware, DoctorController.getAllDoctors)

// Patient Routes
router.post('/patient/add', PatientController.addPatient)
router.patch('/patient/edit/:id', adminMiddleware, PatientController.editPatient)
router.get('/patient/getAll', adminMiddleware, PatientController.getAllPatients)
router.get('/patient/get/:id', adminMiddleware, PatientController.getPatient)

module.exports = router
