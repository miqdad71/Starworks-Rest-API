const {
  getAllCompany,
  getCompanyById,
  updateCompany
} = require('../models/company')

const {
  statusGet,
  statusUpdate,
  statusUpdateFail,
  statusServerError,
  statusNotFound
} = require('../helpers/status')

module.exports = {
  getAllCompany: async (_req, res, _next) => {
    try {
      const result = await getAllCompany()

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusServerError(res)
    }
  },

  getCompanyById: async (req, res, _next) => {
    const { cnId } = req.params

    try {
      const result = await getCompanyById(cnId)

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusServerError(res)
    }
  },

  updateCompany: async (req, res, _next) => {
    const { cnId } = req.params
    req.body.image = req.file === undefined ? '' : req.file.filename

    const data = {
      ...req.body,
      cn_profile: req.body.image
    }

    delete data.image

    try {
      const findData = await getCompanyById(cnId)

      if (findData.length) {
        const result = await updateCompany(cnId, data)

        if (result.affectedRows) {
          statusUpdate(res)
        } else {
          statusUpdateFail(res)
        }
      } else {
        statusNotFound(res)
      }
    } catch (err) {
      statusServerError(res)
    }
  }
}
