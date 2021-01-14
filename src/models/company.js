const dbConnect = require('../helpers/db')

module.exports = {
  createCompany: (data) => {
    return new Promise((resolve, reject) => {
      const query = `
        INSERT INTO company
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

  getAllCompany: () => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM company cn
          JOIN account ac
            ON ac.ac_id = cn.ac_id
      `

      dbConnect.query(query, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getCompanyById: (acId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM company cn
          JOIN account ac
            ON ac.ac_id = cn.ac_id
         WHERE ac.?
      `

      dbConnect.query(query, { ac_id: acId }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  updateCompany: (cnId, data) => {
    return new Promise((resolve, reject) => {
      const query = `
        UPDATE company
           SET ?
         WHERE cn_id = ${cnId}
      `

      dbConnect.query(query, data, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  }
}
