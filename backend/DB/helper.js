const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken')
require('dotenv')

function getOffset(currentPage = 1, listPerPage) {
  return (currentPage - 1) * [listPerPage];
}

function emptyOrRows(rows) {
  if (!rows) {
    return [];
  }
  return rows;
}

function hasmore(listPerPage, count) {
  // let temp = rows_count-(offset+listPerPage)
  if (listPerPage == count) {
    return true;
  } else {
    return false;
  }

}

const doctorEmailGenerator = (FN, LN) => {
  const signature = "mobicare.com"
  const randomNum = Math.floor(Math.random() * 100);
  const email = `${FN}_${LN}${randomNum}@${signature}`
  return email
}

const hashingPassword = async (password) => {
  const salt = process.env.SALT

  let HASHED_PASSWORD_V = await bcrypt.hash(password, salt);

  HASHED_PASSWORD_V = `'${HASHED_PASSWORD_V}'`

  return HASHED_PASSWORD_V;
}

const generateAccessToken = async (obj) => {
  return await jwt.sign(obj, process.env.ACCESS_TOKEN_SECRET, { expiresIn: "7h" });
}

const getCurrent = async () => {
  let date_time = new Date();

  // get current date
  // adjust 0 before single digit date
  let date = ("0" + date_time.getDate()).slice(-2);

  // get current month
  let month = ("0" + (date_time.getMonth() + 1)).slice(-2);

  // get current year
  let year = date_time.getFullYear();

  // get current hours
  let hours = date_time.getHours() + 1;

  // get current minutes
  let minutes = date_time.getMinutes();

  // get current seconds
  let seconds = date_time.getSeconds();


  // prints date & time in YYYY-MM-DD HH:MM:SS format

  return (year + "-" + month + "-" + date + " " + hours + ":" + minutes + ":" + seconds);
}

module.exports = {
  generateAccessToken,
  getOffset,
  emptyOrRows,
  hasmore,
  doctorEmailGenerator,
  hashingPassword,
  getCurrent
}
