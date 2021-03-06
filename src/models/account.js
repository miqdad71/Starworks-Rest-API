const dbConnect = require('../helpers/db')

const { createEngineer } = require('./engineer')
const { createCompany } = require('./company')

module.exports = {
  createAccount: (data) => {
    return new Promise((resolve, reject) => {
      const dataAcc = {
        ac_name: data.ac_name,
        ac_email: data.ac_email,
        ac_phone: data.ac_phone,
        ac_password: data.ac_password,
        ac_level: data.ac_level
      }

      const query = `
        INSERT INTO account
                SET ?
      `

      dbConnect.query(query, dataAcc, async (err, res, _fields) => {
        if (!err) {
          if (parseInt(data.ac_level) === 0) {
            await createEngineer(res.insertId)
          } else {
            await createCompany({
              ac_id: res.insertId,
              cn_company: data.cn_company,
              cn_position: data.cn_position
            })
          }

          resolve(res)
        } else {
          reject(err)
        }
      })
    })
  },

  updateAccount: (acId, data) => {
    return new Promise((resolve, reject) => {
      const query = `
        UPDATE account
           SET ?
         WHERE ac_id = ${acId}
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

  getAccountById: (acId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM account
         WHERE ?
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

  getAccountByEmail: (acEmail) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT *
          FROM account ac
         WHERE ?
      `

      dbConnect.query(query, { ac_email: acEmail }, (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  }
}
