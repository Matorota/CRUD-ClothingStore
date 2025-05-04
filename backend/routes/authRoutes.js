import express from "express";
import db from "../db/db.js"; // Ensure this points to your database connection file

// this is a TEMPORARY . The main is in index.js

const router = express.Router();

// User login route
router.post("/login-user", (req, res) => {
  const { User_name, User_surname, User_password } = req.body;

  // Validate input
  if (!User_name || !User_surname || !User_password) {
    return res.status(400).json({ error: "All fields are required" });
  }

  const query = `
    SELECT idUser AS id, User_name, User_surname, User_password, 'user' AS role
    FROM user
    WHERE User_name = ? AND User_surname = ? AND User_password = ?;
  `;

  db.query(query, [User_name, User_surname, User_password], (err, data) => {
    if (err) {
      console.error("Database error:", err);
      return res.status(500).json({ error: "Internal server error" });
    }

    if (data.length === 0) {
      return res.status(401).json({ error: "Invalid credentials" });
    }

    return res.json(data[0]);
  });
});

export default router;
