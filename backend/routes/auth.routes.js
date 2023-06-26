const router = require("express").Router()

const authController = require('../controller/auth.controller')

// admin auth
router.post('/admin/login', authController.AdminLogin)

// regular users auth (patient, doctor)
router.post('/login', authController.login_Handler)
router.post('/token', authController.refrshAccessToken)

module.exports = router
