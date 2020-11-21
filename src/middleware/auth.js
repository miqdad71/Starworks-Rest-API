require('dotenv')
const bcrypt = require('bcrypt')
const jwt = require('jsonwebtoken')

const {
  statusTokenError,
  statusLoginRequired
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

      jwt.verify(token, process.env.JWT_KEY, (err, _data) => {
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
