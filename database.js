const mysql = require('mysql')

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'jobnew'
})

connection.connect(err => {
    if (err) throw err;
    console.log('Connect !')
})

exports.dbConnection = connection