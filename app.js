const express = require('express')
const app = express()
const conn = require('./config/db')
const cors = require("cors");


app.use(express.json())
// 👇️ configure CORS
app.use(cors());

// app.use(function (req, res, next) {
//   res.header("Access-Control-Allow-Origin", "*");
//   res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
//   res.header("Access-Control-Allow-Headers", "x-access-token, Origin, X-Requested-With, Content-Type, Accept");
//   next();
// });

app.post('/login', function (req, res) {
  const queryStr = `SELECT * FROM users_login WHERE email = '${req.body.email}' AND password = '${req.body.password}'`;
  console.log("queryStr", queryStr);
  conn.query(queryStr, (err, results) => {
    console.log("results", results);
    if (err) {
      res.error(err.sqlMessage, res);
    } else {

      if (results.length != 0) {
        res.status(200).json({
          "success": true,
          "message": "Berhasil login",
          "data": results
        });

      } else {
        res.status(404).json({
          "success": false,
          "message": "Username atau password tidak ditemukan",
          "data": results
        });
      }
    }
  })
})

app.post('/profil', function (req, res) {
  const param = req.body;
  const kd_users = param.kd_users;
  const nama = param.nama;
  const rt = param.rt;
  const rw = param.rw;
  const alamat = param.alamat;
  const foto = param.foto;
  const pendapatan = param.pendapatan;
  const pekerjaan = param.pekerjaan;
  const status_perkawinan = param.status_perkawinan;
  const jumlah_anak = param.jumlah_anak;
  const jenis_kelamin = param.jenis_kelamin;
  const tanggal_lahir = param.tanggal_lahir;
  const tempat_lahir = param.tempat_lahir;
  const agama = param.agama;
  const alamat_asal = param.alamat_asal;
  const queryStr = 'INSERT INTO users_detail (kd_users, nama,rt,rw,alamat,foto,pendapatan,pekerjaan,status_perkawinan,jumlah_anak,jenis_kelamin,tanggal_lahir,tempat_lahir,agama,alamat_asal) VALUES (?, ?,?,?,?,?, ?,?,?,?,?, ?,?,?,?)';
  const values = [kd_users, nama, rt, rw, alamat, foto, pendapatan, pekerjaan, status_perkawinan, jumlah_anak, jenis_kelamin, tanggal_lahir, tempat_lahir, agama, alamat_asal];

  conn.query(queryStr, values, (err, results) => {
    if (err) {
      console.log(err);
    } else {
      if (results.length != 0) {
        res.status(200).json({
          "success": true,
          "message": "Berhasil update profil",
          "data": null
        });

      } else {
        res.status(404).json({
          "success": false,
          "message": "Gagal menambahkan data",
          "data": err
        });
      }
    }
  })
})


app.post('/register', function (req, res) {
  const param = req.body;
  const nama = param.nama;
  const nik = param.nik;
  const password = param.password;
  const role = param.role;
  const email = param.email;
  const queryStr = 'INSERT INTO users_login (nama, nik, password, role, email) VALUES (?, ?,?,?,?)';
  const values = [nama, nik, password, role, email];

  conn.query(queryStr, values, (err, results) => {
    if (err) {
      console.log(err);
    } else {
      if (results.length != 0) {
        res.status(200).json({
          "success": true,
          "message": "Berhasil login",
          "data": null
        });

      } else {
        res.status(404).json({
          "success": false,
          "message": "Gagal menambahkan data",
          "data": err
        });
      }
    }
  })
})

app.post('/pengajuan', function (req, res) {

  const d = new Date();
  let year = d.getFullYear();
  let month = d.getMonth() + 1;
  let notransaksi = 'KTR' + year + '000' + month


  const param = req.body;

  console.log("BODY", param);
  const no_pengajuan = notransaksi;
  const kd_user = param.kd_user;
  const user = param.user;
  const rt = param.rt;
  const rw = param.rw;
  const deskripsi = param.deskripsi;
  const status = param.status;
  const tanggal_pengajuan = new Date()


  conn.query(`SELECT max(id) as maxid FROM pengajuan`, (err, result) => {

    let finalnotrans = no_pengajuan + (result[0].maxid + 1)

    const queryStr = 'INSERT INTO pengajuan (no_pengajuan, kd_user, user, rt, rw, deskripsi, status, tanggal_pengajuan) VALUES (?, ?,?,?,?,?,?, ?)';
    const values = [finalnotrans, kd_user, user, rt, rw, deskripsi, status, tanggal_pengajuan];

    conn.query(queryStr, values, (err, results) => {
      if (err) {
        console.log(err);
      } else {
        if (results.length != 0) {
          res.status(200).json({
            "success": true,
            "message": "Berhasil mengajukan pengajuan, menunggu persetujuan",
            "data": null
          });

        } else {
          res.status(404).json({
            "success": false,
            "message": "Gagal menambahkan data",
            "data": err
          });
        }
      }
    })

  })

})

app.post('/update-mahasiswa', function (req, res) {
  const param = req.body;
  const id = param.id;
  const name = param.name;
  const jurusan = param.jurusan;
  const queryStr = 'UPDATE mahasiswa SET name = ?, jurusan = ? WHERE id = ? AND deleted_at IS NULL';
  const values = [name, jurusan, id];
  conn.query(queryStr, values, (err, results) => {
    if (err) {
      console.log(err);
    } else {
      res.status(200).json({
        "success": true,
        "message": "Sukses mengubah data",
        "data": null
      });
    }
  })
})

app.post('/delete-mahasiswa', function (req, res) {
  const param = req.body;
  const id = param.id;
  const queryStr = 'UPDATE mahasiswa SET deleted_at = ? WHERE id = ?';
  const now = new Date();
  const values = [now, id];
  conn.query(queryStr, values, (err, results) => {
    if (err) {
      console.log(err);
    } else {
      res.status(200).json({
        "success": true,
        "message": "Sukses menghapus data",
        "data": null
      });
    }
  })
})

app.listen(3000)