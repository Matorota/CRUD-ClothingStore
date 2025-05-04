import mysql from "mysql2";

// this is a TEMPORARY Connection. The main is in index.js

const db = mysql.createConnection({
  host: "localhost",
  user: "root", // Replace with your database username
  password: "root", // Replace with your database password
  database: "betterClothes", // Replace with your database name
});

db.connect((err) => {
  if (err) {
    console.error("Database connection failed:", err.message);
    process.exit(1);
  }
  console.log("Connected to the database.");
});

export default db;
