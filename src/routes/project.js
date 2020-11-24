const express = require('express')
const router = express.Router()

const {
  createProject,
  getAllProject,
  getAllProjectById,
  getProjectById,
  updateProject,
  deleteProject
} = require('../controllers/ProjectController')

const {
  authorization
} = require('../middleware/auth')

const uploadImage = require('../middleware/multer')

router.post('/', authorization, uploadImage, createProject)
router.get('/', getAllProject)
router.get('/:cnId', getAllProjectById)
router.get('/detail/:pjId', getProjectById)
router.put('/:pjId', authorization, uploadImage, updateProject)
router.delete('/:pjId', deleteProject)

module.exports = router
