import express from 'express';
import { insertSql } from '../database/sql';

const router = express.Router();

router.get('/', (req, res) => {
    res.render('home', { data: " " });
})

router.post('/', (req, res) => {
    const vars = req.body;

    const data = {
        Id: vars.Id,
        Name: vars.Name,
        Email: vars.Email,
        Phone_Number: vars.Phone_Number,
        Major: vars.Major,
        Department_Id: vars.Department_Id
    };
    insertSql.setStudent(data);
})

module.exports = router;
