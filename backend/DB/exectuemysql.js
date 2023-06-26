const mysql = require('mysql2/promise');
const config = require('./mysqlconfig');

async function query(sql, params) {
  const connection = await mysql.createConnection(config.db);
  const [results,] = await connection.execute(sql, params);
  connection.end();

  return results;
}

module.exports = {
  query
}