const jwt = require("jsonwebtoken");
const JWT_KEY = "santhosh@225";

const authMiddleware= (request, response, next) => {
    const authHeader = request.headers.authorization;
    
    console.log("Header: ",authHeader);

    if(!authHeader){
        return response.status(401).json({
            message: "Token Missing"
        });
    }

    const token = authHeader.split(" ")[1];

    try {
        const decoded = jwt.verify(token, JWT_KEY);

        request.user = decoded;
        console.log("Decoded: ",decoded);

        next();
    } catch (error) {
        return response.status(401).json({
            message: "Invalid Token"
        });
    }
};

module.exports = authMiddleware;