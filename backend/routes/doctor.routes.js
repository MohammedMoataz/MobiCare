const router = require("express").Router()

const DoctorController = require('../controller/doctor.controller')
const doctorMiddleware = require('../middlewares/doctorAuth.middleware')

// post routes
router.post('/assignPatient', DoctorController.addDoctorPatient)
router.post('/addNote', doctorMiddleware, DoctorController.addNote)
router.post('/addVideo', doctorMiddleware, DoctorController.addVideo)

// edit routes
router.patch('/editProfile/:id', doctorMiddleware, DoctorController.editDoctor)
router.patch('/editNote', doctorMiddleware, DoctorController.editNote)
router.put('/fuid/add', doctorMiddleware, DoctorController.addFUID)
router.patch('/editVideo', doctorMiddleware, DoctorController.editVideo)

// get routes
router.get('/get/:id', doctorMiddleware, DoctorController.getDoctor)
router.get('/searchDoctorPatients', doctorMiddleware, DoctorController.DoctorSearchPatientsByName)
router.get('/getNote', doctorMiddleware, DoctorController.getNote)
router.get('/getDoctorPatients/:id', DoctorController.getDoctorPatients)
router.get('/searchSpec', DoctorController.searchDoctorBySpecialization)
router.get('/search', DoctorController.searchDoctorByName)
router.get('/getAllVideos', DoctorController.getAllVideo)
router.get('/getVideo/:DOCTOR_ID', doctorMiddleware, DoctorController.getVideo)
router.get('/getVideo', doctorMiddleware, DoctorController.getVideo)

// delete routes
router.delete('/delNote', doctorMiddleware, DoctorController.delNote)
router.delete('/delVideo/:id', doctorMiddleware, DoctorController.delVideo)

module.exports = router
