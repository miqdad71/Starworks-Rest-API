const express = require('express')
const router = express.Router()

const {
  detailAccount,
  createAccount,
  updateAccount,
  updateAccountPass,
  loginAccount,
  checkEmail
} = require('../controllers/account')

const {
  hashPassword
} = require('../middleware/auth')

router.post('/', hashPassword, createAccount)
router.put('/:acId', updateAccount)
router.put('/password/:acId', hashPassword, updateAccountPass)
router.post('/login', loginAccount)
router.post('/check', checkEmail)
router.get('/detail/:acId', detailAccount)

module.exports = router
