const express = require('express')
const router = express.Router()
const uploadImage = require('../src/middleware/multer')

const {
  createProject,
  getAllProjectById,
  getProjectById,
  updateProject,
  deleteProject
} = require('../src/controllers/ProjectController')

router.post('/', createProject)
router.get('/:cnId', getAllProjectById)
router.get('/detail/:pjId', getProjectById)
router.put('/:pjId', uploadImage, updateProject)
router.delete('/:pjId', deleteProject)

module.exports = router
