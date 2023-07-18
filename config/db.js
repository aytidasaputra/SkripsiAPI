const mysql = require('mysql')
const conn = mysql.createPool({
  host: "localhost",
  user: "root",
  password: "",
  charset: "utf8mb4",
  database: "db_unindra_skrips",
  timezone: '+00:00'
})
conn.getConnection((err) => {
  if (err) throw err
  console.log('Connected!')
})

module.exports = conn
