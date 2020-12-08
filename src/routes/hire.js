const express = require('express')
const router = express.Router()

const {
  createHire,
  getAllHireByEngineer,
  getAllHireByProject,
  updateHireStatus
} = require('../controllers/hire')

const {
  authorization
} = require('../middleware/auth')

router.post('/', authorization, createHire)
router.get('/engineer/:enId', authorization, getAllHireByEngineer)
router.get('/project/:pjId', authorization, getAllHireByProject)
router.put('/:hrId', authorization, updateHireStatus)

module.exports = router
