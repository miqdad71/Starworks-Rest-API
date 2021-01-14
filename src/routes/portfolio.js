const express = require('express')
const router = express.Router()

const {
  createPortfolio,
  getAllPortfolioById,
  getPortfolioById,
  updatePortfolio,
  deletePortfolio
} = require('../controllers/portfolio')

const {
  authorization
} = require('../middleware/auth')

const uploadImage = require('../middleware/multer')

router.post('/', authorization, uploadImage, createPortfolio)
router.get('/:enId', authorization, getAllPortfolioById)
router.get('/detail/:prId', authorization, getPortfolioById)
router.put('/:prId', authorization, uploadImage, updatePortfolio)
router.delete('/:prId', authorization, deletePortfolio)

module.exports = router
