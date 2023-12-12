const express = require('express')
const connection = require('./database').dbConnection
const bodyParser = require('body-parser')
const router = express.Router()
const multer = require('multer')
const path = require('path')

const app = express();
app.use(express.static('./Source Code/assets/uploads'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: true }))

let storage = multer.diskStorage({
    destination: (req, file, callBack) => {
        callBack(null, './Source Code/assets/uploads/')     // './public/images/' directory name where save the file
    },
    filename: (req, file, callBack) => {
        callBack(null, file.fieldname + '-' + Date.now() + path.extname(file.originalname))
    }
})

let upload = multer({
    storage: storage
})



app.get('/', (req, res, next) => {
    connection.query('SELECT P.*, M.* FROM prestasi P INNER JOIN mahasiswa M ON P.mahasiswa = M.nim', (err, rows) => {
        if (err) {
            res.json({
                data: err
            })
        } else {
            res.json({
                data: rows
            })
        }
    })
})

app.post('/addPrestasi', upload.single('image'), (req, res, next) => {
    let namaPrestasi = req.body.namaPrestasi
    let jenisPrestasi = req.body.jenisPrestasi
    let thnPrestasi = req.body.thnPrestasi
    let mahasiswa = req.body.mahasiswa
    var imgsrc = req.file.filename
    const query = `INSERT INTO prestasi (
        id_prestasi, nama_prestasi, jenis_prestasi, thn_prestasi, dokumen, mahasiswa
    ) VALUES (
        "",
        "${namaPrestasi}",
        "${jenisPrestasi}",
        "${thnPrestasi}",
        "${imgsrc}",
        "${mahasiswa}"
    )`
    connection.query(query, (err, result) => {
        if (err) {
            res.json({
                error: err
            })
            console.log(err)
        } else {
            res.redirect('/')
        }
    })
})

module.exports = app