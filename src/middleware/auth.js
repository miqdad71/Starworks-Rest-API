require('dotenv').config()
const bcrypt = require('bcrypt')
const JWT = require('jsonwebtoken')

const {
  statusLoginRequired,
  statusTokenError
} = require('../helpers/status')

module.exports = {
  hashPassword: (req, _res, next) => {
    bcrypt.hash(req.body.ac_password, 10, (err, hash) => {
      if (!err) {
        req.body.ac_password = hash
        next()
      } else {
        console.error(err)
      }
    })
  },

  authorization: (req, res, next) => {
    let token = req.headers.authorization

    if (token) {
      token = token.split(' ')[1]

      JWT.verify(token, process.env.JWT_KEY, (err, _data) => {
        if ((err && err.name === 'JsonWebTokenError') || (err && err.name === 'TokenExpiredError')) {
          statusTokenError(res, err)
        } else {
          next()
        }
      })
    } else {
      statusLoginRequired(res)
    }
  }
}
