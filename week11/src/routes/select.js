import express from "express";
import { createSql, selectSql } from "../database/sql";
// TODO

const router = express.Router();

router.get('/', async function (req, res) {
    // TODO
    if (req.cookies.user) {
        const studentId = req.cookies.user;
        const classInformation = await selectSql.getClass(studentId);
        const allClass = await selectSql.getCountParticipant(studentId);
        res.render('select', { user: req.cookies.user, classInformation, allClass });
    } 
    else {
        res.render('/')
    }

});

router.post('/', async(req, res) => {
    // TODO
    const data = {
        cId: req.body.applyBtn,
        sId: req.cookies.user,
    };
    if (data.sId)
    {
        await createSql.addClass(data);
        const classInformation = await selectSql.getClass(data.sId);
        const allClass = await selectSql.getCountParticipant(data.sId);
        res.render('select', { user: req.cookies.user, classInformation, allClass });
    }
    else {
        res.render('/')
    }
    
});

module.exports = router;