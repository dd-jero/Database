import express from 'express';
import { selectSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    if (req.session.user == undefined) {
        res.redirect('/');
    } else if (req.session.user.role === 'student' || req.session.user.role === 'super') {
        const studentId = req.session.user.id;
        const studentInformation = await selectSql.getStudent(studentId);
        res.render('select', {
            title: "My information",
            studentInformation,
        });
    } else {
        res.redirect('/');
    }
});

module.exports = router;
