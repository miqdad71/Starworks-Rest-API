require('dotenv').config()
const bodyParser = require('body-parser')
const express = require('express')
const app = express()
const morgan = require('morgan')
const cors = require('cors')
const port = process.env.PORT

const accountRouter = require('./src/routes/account')
const engineerRouter = require('./src/routes/engineer')
const companyRouter = require('./src/routes/company')
const skillRouter = require('./src/routes/skill')
const experienceRouter = require('./src/routes/experience')
const portofolioRouter = require('./src/routes/portofolio')
const projectRouter = require('./src/routes/project')
const hireRouter = require('./src/routes/hire')

// Middleware
app.use(bodyParser.urlencoded({ extended: false }))
app.use(morgan('dev'))
app.use(cors())

// Config CORS
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*')
  res.header(
    'Access-Control-Allow-Headers',
    'Origin, X-Requested-With, Content-Type, Accept, Authorization'
  )
  next()
})

app.use('/image', express.static('./uploads'))

// routes access
// app.use('/', indexRouter)
app.use('/account', accountRouter)
app.use('/engineer', engineerRouter)
app.use('/company', companyRouter)
app.use('/skill', skillRouter)
app.use('/experience', experienceRouter)
app.use('/portofolio', portofolioRouter)
app.use('/project', projectRouter)
app.use('/hire', hireRouter)

app.get('/', (req, res) => {
  res.send('Welcome to StarworkS')
})

app.listen(port, () => {
  console.log(`Listen StarworkS backend on port ${port}`)
})
