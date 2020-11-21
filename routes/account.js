const express = require('express')
const router = express.Router()
const uploadImage = require('../src/middleware/multer')

const {
  createAccount,
  updateAccount,
  loginAccount
} = require('../src/controllers/AccountController')

const {
  hashPassword
} = require('../src/middleware/auth')

router.post('/', hashPassword, uploadImage, createAccount)
router.put('/:acId', hashPassword, updateAccount)
router.post('/login', loginAccount)

module.exports = router
