const express = require('express')
const router = express.Router()
const uploadImage = require('../src/middleware/multer')

const {
  getAllCompany,
  getCompanyById,
  updateCompany
} = require('../src/controllers/CompanyController')

router.get('/', getAllCompany)
router.get('/detail/:cnId', getCompanyById)
router.put('/:cnId', uploadImage, updateCompany)

module.exports = router
