import express from 'express';
import { selectSql, deleteSql } from '../database/sql';

const router = express.Router();

router.get('/', async (req, res) => {
    if (req.session.user != undefined && req.session.user.role === 'student') {
        const studentId = req.session.user.id; // 학생의 학번 
        const classId = await selectSql.getClass(studentId); // 해당 학생에 대한 수업 id을 가져옴 
        res.render('deleteclass', { // render의 첫번째로 들어가는 인자는 hbs 파일명
            title: "Delete",
            classId,
        });
    } else{
        res.redirect('/');
    }
});

router.post('/', async (req, res) => {
    console.log("delete :", req.body.delBtn);
    const data = {
        studentId: req.session.user.id,
        Id: req.body.delBtn // deleteclass.hbs의 buttond의 name이 delBtn (해당 정보를 가저옴)
    };

    await deleteSql.deleteClass(data.studentId, data.Id); // 학번과 수업 ID를 이용해 삭제 

    res.redirect('/delete/class');
});

module.exports = router;
