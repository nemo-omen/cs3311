import mysql from 'mysql2-promise';
import dbConfig from './config/db.config.js';

const {host, user, password, database} = dbConfig;

const connection = mysql
  .createConnection({host, user, password})
  .then((connection) => {
    connection.query(`CREATE DATABASE IF NOT EXISTS ${database}`);
  });

connection.connect((error) => {
  if(error) throw error;
    console.log(`Connected to database ${dbConfig.database} at ${dbConfig.host}`);
});