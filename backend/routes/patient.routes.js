const router = require("express").Router()

const PatientController = require('../controller/patient.controller')
const patinetMiddleware = require('../middlewares/patientAuth.middleware')

// post routes
router.post('/register', PatientController.addPatient)
router.post('/symptom/add', patinetMiddleware, PatientController.addSymptom)

// edit routes
router.patch('/edit', patinetMiddleware, PatientController.editPatient)
router.put('/fuid/add', patinetMiddleware, PatientController.addFUID)

// get routes
router.get('/symptom/getAll', PatientController.getSymptoms)
router.get('/get/:id', PatientController.getPatient)
router.get('/getDoctors', patinetMiddleware, PatientController.getDoctors)

// delete routes
router.delete('/symptom/delete', patinetMiddleware, PatientController.deleteSymptom)

module.exports = router
