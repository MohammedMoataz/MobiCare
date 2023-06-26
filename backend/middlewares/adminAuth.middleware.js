const jwt = require("jsonwebtoken")
const adminAuth = async (req, res, next) => {
    try {
        const token = req.header("Authorization").replace("Bearer ", "")
        const decoded = await jwt.verify(token, process.env.ACCESS_TOKEN_SECRET);

        if (decoded.role == "ADMIN") {
            next();

        } else {
            throw new Error
        }

    } catch (error) {
        res.status(500).send({ apiStatus: false, data: error, message: "unauthorized" })
    }
}

module.exports = adminAuth