# MobiCare Backend

This repository contains the backend code for the MobiCare project. Follow the steps below to set up and run the project.

## Prerequisites

- Node.js
- npm
- MySQL

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/MohammedMoataz/MobiCare.git

2. **Navigate to the backend directory:**

   ```bash
   cd backend

3. **Install dependencies:**
   ```bash
   npm install

4. Execute the SQL script to set up the database: Import the `MobiCare.sql` file into your MySQL database.

5. Create a `.env` file: Create a .env file in the backend directory with the following content:

  ```bash
  DB_HOST=[host name]
  USER=[db user]
  DB_DATABASE=mobicare
  DB_PASSWORD=[db password]
  SALT=[salt secret]
  ACCESS_TOKEN_SECRET=[access token secret]
  REFRESH_TOKEN_SECRET=[refresh token secret]

6. **Run the server:**
   ```bash
   nodemon index.js

6. **Usage:**
After completing the above steps, the backend server should be running. You can now interact with the API endpoints as needed.
