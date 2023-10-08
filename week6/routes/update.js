import express from 'express';
import { selectSql, updateSql, updateSql_department } from '../database/sql';

const router = express.Router();

router.get('/student', async (_req, res) => {
    const student_res = await selectSql.getStudent();
    console.log(student_res)
    res.render('updateStudent', {
        main_title: "Jaeyoung: UPDATE 'Student' table",
        student_res,
    });
});
router.post('/student', async (req, res) => {
    const vars = req.body;
    const data = {
        Id: vars.Id,
        Name: vars.Name,
        Email: vars.Email,
        Phone_Number: vars.Phone_Number,
        Major: vars.Major,
        Department_Id: vars.Department_Id
    }
    await updateSql.updateStudent(data);

    res.redirect('/update/student');
})

router.get('/department', async (_req, res) => {
    const department_res = await selectSql.getDepartment();
    console.log(department_res)
    res.render('updateDepartment', {
        main_title: "Jaeyoung: UPDATE 'Department' table",
        department_res,
    });
});
router.post('/department', async (req, res) => {
    const vars = req.body;
    const data = {
        Id: vars.Id,
        Name: vars.Name,
        Email: vars.Email,
        Phone_Number: vars.Phone_Number,
        Building_Id: vars.Building_Id,
    }
    await updateSql_department.updateDepartment(data);

    res.redirect('/update/department');
})

module.exports = router;

// updatedepartment 추가