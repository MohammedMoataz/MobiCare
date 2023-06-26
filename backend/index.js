const express = require("express");
const cors = require("cors");
const app = express();
const helmet = require('helmet');
require('dotenv').config();

//utils
const logger = require('./Utils/logger');

//secure headers
app.use(helmet());
app.use(cors());

//middleware for cookies
app.use(express.json({ limit: '50mb' }));
app.use(express.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));

//routes
app.use("/", require('./routes/auth.routes'));
app.use("/admin", require('./routes/admin.routes'));
app.use("/doctor", require('./routes/doctor.routes'));
app.use("/patient", require('./routes/patient.routes'));

//listen to port 5000
const port = process.env.PORT || 5000;

app.listen(port, async () => {
    try {
        // fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
        logger.info('database connected .........')
        logger.info(`server running on ${port}`)

    } catch (error) {
        logger.error(error);
        process.exit(1);
    }
});
