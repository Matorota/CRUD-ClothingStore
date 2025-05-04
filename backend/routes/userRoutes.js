import express from "express";
import db from "../db/db.js";

const router = express.Router();

// this is a TEMPORARY . The main is in index.js

// Register a new user
router.post("/", (req, res) => {
  const { user_name, user_surname, user_password } = req.body;

  if (!user_name || !user_surname || !user_password) {
    return res.status(400).json({ error: "All fields are required" });
  }

  const query = `
    INSERT INTO user (User_name, User_surname, User_password)
    VALUES (?, ?, ?)
  `;
  db.query(query, [user_name, user_surname, user_password], (err, result) => {
    if (err) {
      console.error("Error inserting user:", err.message);
      return res.status(500).json({ error: "Failed to register user" });
    }
    res.status(201).json({ message: "User registered successfully" });
  });
});

export default router;
