const fs = require('fs');
const path = require("path");

const key={
    private : fs.readFileSync(path.resolve(__dirname, "./private")),
    public : fs.readFileSync(path.resolve(__dirname, "./public.pem"))
}

module.exports = key