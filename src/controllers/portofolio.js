const {
  createPortofolio,
  getAllPortofolioById,
  getPortofolioById,
  updatePortofolio,
  deletePortofolio
} = require('../models/portofolio')

const {
  statusGet,
  statusCreate,
  statusCreateFail,
  statusUpdate,
  statusUpdateFail,
  statusDelete,
  statusDeleteFail,
  statusServerError,
  statusNotFound
} = require('../helpers/status')

module.exports = {
  getAllPortofolioById: async (req, res, _next) => {
    const { enId } = req.params

    try {
      const result = await getAllPortofolioById(enId)

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusServerError(res)
    }
  },

  getPortofolioById: async (req, res, _next) => {
    const { prId } = req.params

    try {
      const result = await getPortofolioById(prId)

      if (result.length) {
        statusGet(res, result)
      } else {
        statusNotFound(res)
      }
    } catch (error) {
      statusServerError(res)
    }
  },

  createPortofolio: async (req, res, _next) => {
    req.body.image = req.file === undefined ? '' : req.file.filename

    const data = {
      ...req.body,
      pr_image: req.body.image
    }

    delete data.image

    try {
      const result = await createPortofolio(data)

      if (result.affectedRows) {
        statusCreate(res)
      } else {
        statusCreateFail(res)
      }
    } catch (err) {
      statusServerError(res)
    }
  },

  updatePortfolio: async (req, res, _next) => {
    const { prId } = req.params

    try {
      const findData = await getPortfolioById(prId)

      if (findData.length) {
        req.body.image = req.file === undefined ? findData[0].pr_image : req.file.filename

        const data = {
          ...req.body,
          pr_image: req.body.image
        }

        delete data.image

        const result = await updatePortfolio(prId, data)

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
  },

  deletePortofolio: async (req, res, _next) => {
    try {
      const { prId } = req.params
      const findData = await getPortofolioById(prId)

      if (findData.length) {
        const result = await deletePortofolio(prId)

        if (result.affectedRows) {
          statusDelete(res)
        } else {
          statusDeleteFail(res)
        }
      } else {
        statusNotFound(res)
      }
    } catch (err) {
      statusServerError(res)
    }
  }
}
