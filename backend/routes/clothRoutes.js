import express from "express";
import db from "../db/db.js";

const router = express.Router();

// this is a TEMPORARY . The main is in index.js

// Get all cloth items
router.get("/", (req, res) => {
  const q = `
    SELECT c.Cloth_ID, c.Cloth_Name, c.Cloth_photo, c.Cloth_color, c.Price
    FROM cloth c
  `;
  db.query(q, (err, data) => {
    if (err) return res.json(err);
    return res.json(data);
  });
});

// Add a new cloth item
router.post("/", (req, res) => {
  const q =
    "INSERT INTO cloth (`Cloth_Name`, `Cloth_photo`, `Cloth_color`, `Price`, `Type_id`) VALUES (?)";
  const values = [
    req.body.Cloth_Name,
    req.body.Cloth_photo,
    req.body.Cloth_color,
    req.body.Price,
    req.body.Type_id || 1,
  ];
  db.query(q, [values], (err, data) => {
    if (err) return res.status(500).json(err);
    return res.status(201).json("Cloth item has been added successfully.");
  });
});

// Update a cloth item
router.put("/:id", (req, res) => {
  const clothId = req.params.id;
  const q =
    "UPDATE cloth SET `Cloth_Name` = ?, `Cloth_photo` = ?, `Cloth_color` = ?, `Price` = ? WHERE Cloth_ID = ?";
  const values = [
    req.body.Cloth_Name,
    req.body.Cloth_photo,
    req.body.Cloth_color,
    req.body.Price,
  ];
  db.query(q, [...values, clothId], (err, data) => {
    if (err) return res.status(500).json(err);
    return res.json("Cloth item has been updated successfully.");
  });
});

// Delete a cloth item
router.delete("/:id", (req, res) => {
  const clothId = req.params.id;
  const q = "DELETE FROM cloth WHERE Cloth_ID = ?";
  db.query(q, [clothId], (err, data) => {
    if (err) return res.send(err);
    return res.json(data);
  });
});

export default router;
