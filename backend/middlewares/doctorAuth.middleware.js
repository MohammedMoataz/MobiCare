const jwt = require("jsonwebtoken")
const doctorAuth = async (req, res, next) => {
    try {
        
        const token = req.header("Authorization").replace("Bearer ", "")
        const decoded = await jwt.verify(token, process.env.ACCESS_TOKEN_SECRET);
        
        req.ID = decoded.ID;
        if (decoded.role == "DOCTOR") {
            next();

        } else {
            throw new Error
        }

    } catch (error) {
        res.status(500).send({ apiStatus: false, data: error, message: "unauthorized" })
    }
}

module.exports = doctorAuth