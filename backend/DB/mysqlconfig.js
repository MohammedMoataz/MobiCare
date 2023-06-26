const config = {
  db: {
    host: process.env.DB_HOST,
    user: process.env.USER,
    database: process.env.DB_DATABASE,
    password: process.env.DB_PASSWORD,

  },
  listPerPage: 10,
};

module.exports = config;