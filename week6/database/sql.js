import mysql from 'mysql2';

require("dotenv").config();

// spl에 접속하기 위한 정보
const pool = mysql.createPool({
    host: 'localhost',
    port: 3306,
    user: 'root',
    password: 'dfy4r6wn@',
    database: 'inha_week6',
});

const promisePool = pool.promise();

// select query
export const selectSql = {
    getBuilding: async () => {
        const sql = `select * from Building`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getDepartment: async () => {
        const sql = `select * from Department`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getRoom: async () => {
        const sql = `select * from Room`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getStudent: async () => {
        const sql = `select * from Student`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getClass: async () => {
        const sql = `select * from Class`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    getClub: async () => {
        const sql = `select * from Club`;
        const [result] = await promisePool.query(sql);
        return result;
    },
    
}

// insert query
export const insertSql = {
    setStudent: async (data) => {
        const sql = `insert into student values (
            "${data.Id}", "${data.Name}", "${data.Email}", 
            "${data.Phone_Number}", "${data.Major}", "${data.Department_Id}"
        )`
        console.log(data);
        await promisePool.query(sql);
    },
};

// update query
export const updateSql = {
    updateStudent: async (data) => {
        console.log(data);
        const sql = `
            UPDATE Student 
            SET Id = ${data.Id}, Name = "${data.Name}", 
                Email = "${data.Email}", Phone_Number = "${data.Phone_Number}",
                Major = "${data.Major}"
            WHERE Id = ${data.Id}`;
        console.log(sql);
        await promisePool.query(sql);
    },
};

// updatedepartment
export const updateSql_department = {
    updateDepartment: async (data) => {
        console.log(data);
        const sql = `
            UPDATE Department
            SET Id = ${data.Id}, Name = "${data.Name}", 
                Email = "${data.Email}", Phone_Number = "${data.Phone_Number}",
                Building_Id = "${data.Building_Id}"
            WHERE Id = ${data.Id}`;
        console.log(sql);
        await promisePool.query(sql);
    },
};