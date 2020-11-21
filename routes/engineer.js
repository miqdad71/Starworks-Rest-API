const express = require('express')
const router = express.Router()
const uploadImage = require('../src/middleware/multer')

const {
  getAllEngineer,
  getEngineerById,
  getFilterEngineer,
  updateEngineer
} = require('../src/controllers/EngineerController')

router.get('/', getAllEngineer)
router.get('/detail/:enId', getEngineerById)
router.get('/filter', getFilterEngineer)
router.put('/:enId', uploadImage, updateEngineer)

module.exports = router
