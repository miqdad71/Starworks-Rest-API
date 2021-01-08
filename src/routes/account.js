const express = require('express')
const router = express.Router()

const {
  createAccount,
  updateAccount,
  loginAccount
} = require('../controllers/account')

const {
  hashPassword
} = require('../middleware/auth')

router.post('/', hashPassword, createAccount)
router.put('/:acId', hashPassword, updateAccount)
router.post('/login', loginAccount)

module.exports = router
