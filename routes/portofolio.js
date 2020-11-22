const express = require('express')
const router = express.Router()

const {
  createPortofolio,
  getAllPortofolioById,
  getPortofolioById,
  updatePortofolio,
  deletePortofolio
} = require('../src/controllers/PortofolioController')

const {
  authorization
} = require('../src/middleware/auth')

const uploadImage = require('../src/middleware/multer')

router.post('/', authorization, uploadImage, createPortofolio)
router.get('/:enId', authorization, getAllPortofolioById)
router.get('/detail/:prId', authorization, getPortofolioById)
router.put('/:prId', authorization, uploadImage, updatePortofolio)
router.delete('/:prId', authorization, deletePortofolio)

module.exports = router
