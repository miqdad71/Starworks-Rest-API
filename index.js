// require('body-parser').config()
require('dotenv').config()
const bodyParser = require('body-parser')
const express = require('express')
const app = express()
// const router = require('./src/routers/account')
// const router2 = require('./src/routers/project')
// const router3 = require('./src/routers/hire')
// const router4 = require('./src/routers/engineer')
// const router5 = require('./src/routers/ability')
// const router6 = require('./src/routers/experience')
// const router7 = require('./src/routers/portofolio')
// const router8 = require('./src/routers/company')
const morgan = require('morgan')
const cors = require('cors')
const port = process.env.PORT

// routes sources
// const indexRouter = require('./src/routes/index')
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
  res.send('Welcome to GoHire')
})

app.listen(port, () => {
  console.log(`Listen GoHire backend on port ${port}`)
})
