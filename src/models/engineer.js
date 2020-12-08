const dbConnect = require('../helpers/db')

module.exports = {
  createEngineer: (acId) => {
    return new Promise((resolve, reject) => {
      const query = `
        INSERT INTO engineer
                SET ?
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

  getAllEngineer: (paginate) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT en.en_id,
               ac.ac_id,
               ac.ac_name,
               en.en_job_title,
               en.en_job_type,
               en.en_domicile,
               sk.sk_skill_name
          FROM engineer en
          JOIN account ac
            ON ac.ac_id = en.ac_id
          JOIN skill sk
            ON sk.en_id = en.en_id
         ORDER BY ac.ac_id
         LIMIT ${paginate.limit}
        OFFSET ${paginate.offset}
      `

      dbConnect.query(query, async (error, results, _fields) => {
        if (!error) {
          resolve(results)
        } else {
          reject(error)
        }
      })
    })
  },

  getSearchEngineer: (paginate) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT en.en_id,
               ac.ac_id,
               ac.ac_name,
               en.en_job_title,
               en.en_job_type,
               en.en_domicile,
               sk.sk_skill_name
          FROM engineer en
          JOIN account ac 
            ON (ac.ac_id = en.ac_id)
          JOIN skill sk 
            ON (sk.en_id = en.en_id)
         WHERE ac.ac_name
          LIKE '%${paginate.search}%'
            OR sk.sk_skill_name
          LIKE '%${paginate.search}%'
         ORDER BY ac.ac_id
         LIMIT ${paginate.limit} 
        OFFSET ${paginate.offset}
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

  getEngineerById: (enId) => {
    return new Promise((resolve, reject) => {
      const query = `
        SELECT en.en_id,
               ac.ac_id,
               ac.ac_name,
               en.en_job_title,
               en.en_job_type,
               en.en_domicile
          FROM engineer en
          JOIN account ac
            ON ac.ac_id = en.ac_id
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

  getFilterEngineer: (paginate) => {
    return new Promise((resolve, reject) => {
      const filter = parseInt(paginate.filter)
      let fill

      if (filter === 0) {
        fill = 'ac.ac_name'
      } else if (filter === 1) {
        fill = 'sk.sk_skill_name'
      } else if (filter === 2) {
        fill = 'en.en_domicile'
      } else if (filter === 3 || filter === 4) {
        fill = 'en.en_job_type'
      }

      const query = `
          SELECT en.en_id,
                 ac.ac_id,
                 ac.ac_name,
                 en.en_job_title,
                 en.en_job_type,
                 en.en_domicile,
                 sk.sk_skill_name
            FROM engineer en
            JOIN account ac
              ON ac.ac_id = en.ac_id
            JOIN skill sk
              ON sk.en_id = en.en_id
        ORDER BY ${fill}
           LIMIT ${paginate.limit} 
          OFFSET ${paginate.offset}
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

  updateEngineer: (enId, data) => {
    return new Promise((resolve, reject) => {
      const query = `
        UPDATE engineer
           SET ?
         WHERE en_id = ${enId}
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
