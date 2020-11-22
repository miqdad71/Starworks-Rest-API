const express = require('express')
const router = express.Router()

const {
    createAccount,
    updateAccount,
    loginAccount
} = require('../controllers/AccountController')

const {
    hashPassword
} = require('../middleware/auth')

// const uploadImage = require('../middleware/multer')

router.post('/', hashPassword, createAccount)
router.put('/:acId', hashPassword, updateAccount)
router.post('/login', loginAccount)

module.exports = router
