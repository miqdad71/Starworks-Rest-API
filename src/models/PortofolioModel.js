const dbConnect = require('../../config/db.config')

module.exports = {
  createPortofolio: (data) => {
    return new Promise((resolve, reject) => {
      const query = `
        INSERT INTO portofolio
                SET ?
      `

      dbConnect.query(query, data, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getAllPortofolioById: (enId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM portofolio
         WHERE ?
      `

      dbConnect.query(query, { en_id: enId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getPortofolioById: (prId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM portofolio
         WHERE ?
      `

      dbConnect.query(query, { pr_id: prId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  updatePortofolio: (prId, data) => {
    return new Promise((resolve, reject) => {
      const query = `
        UPDATE portofolio
           SET ?
         WHERE pr_id = ${prId}
      `

      dbConnect.query(query, data, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  deletePortofolio: (prId) => {
    return new Promise((resolve, reject) => {
      const query = `
        DELETE FROM portofolio
         WHERE ?
      `

      dbConnect.query(query, { pr_id: prId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  }
}
