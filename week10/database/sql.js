import mysql from 'mysql2';

require("dotenv").config();

const pool = mysql.createPool({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'dfy4r6wn@',
    database: 'inha_week10',
});

const promisePool = pool.promise();

export const selectSql = {
    getUser: async () => {
        const sql = `select * from user`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getStudent: async (Id) => {
        const sql = `select * from student where student.Id = ${Id}`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getClass: async (studentId) => { // 학생과 수업 관계 테이블에 join하여 class에 대한 정보를 가져온 뒤 입력 받은 학번과 동일한 학번에 대한 수업만 출력
        const sql = `select * from class as c join student_has_class as shc on c.Id = shc.Class_Id where shc.Student_Id = ${studentId}`;
        const [result] = await promisePool.query(sql);
        return result;
    }
}

export const deleteSql = {
    deleteDepartment: async (data) => {
        console.log('delete department Dnumber =', data);
        const sql = `delete from department where Dnumber=${data.Dnumber}`
        console.log(sql);
        await promisePool.query(sql);
    },
    deleteClass: async (studentId, classId) => {
        console.log('delete class student =', studentId, 'class =', classId);
        // 학생과 수업 관계 테이블에서 해당 학번과 수업 id에 대한 정보를 삭제
        const deleteEnrollmentSql = `delete from student_has_class WHERE student_id = ${studentId} AND class_id = '${classId}'`;
        console.log(deleteEnrollmentSql);
        await promisePool.query(deleteEnrollmentSql);
    }
};