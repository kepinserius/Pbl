const http = require('http')
const app = require('./app')
const connection = require('./database').dbConnection

const server = http.createServer(app)

server.listen(3000, (err) => {
    if (err) console.log(err)
    console.log('http://localhost:3000')
});
