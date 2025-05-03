import express from "express";
import mysql from "mysql2";
import cors from "cors";

const app = express();

// Enable CORS for all origins
app.use(cors());

// Middleware to parse JSON
app.use(express.json());

const db = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "root",
  database: "betterClothes",
});

// Login endpoint
app.post("/login", (req, res) => {
  const { name, surname, password } = req.body;

  // Query to check admin credentials
  const q = `
    SELECT idAdmin AS id, Name, Surname, Password, 'admin' AS role
    FROM admin
    WHERE Name = ? AND Surname = ? AND Password = ?;
  `;

  db.query(q, [name, surname, password], (err, data) => {
    if (err) return res.status(500).json(err); // Handle server errors
    if (data.length === 0) return res.status(401).json("Invalid credentials"); // No match found
    return res.json(data[0]); // Return the admin data with role
  });
});

app.post("/login-user", (req, res) => {
  const { User_name, User_surname, User_password } = req.body;
  const q = `
SELECT idUser AS id, User_name, User_surname, User_password, 'user' AS role
FROM user
WHERE User_name = ? AND User_surname = ? AND User_password = ?;
`;

  db.query(q, [User_name, User_surname, User_password], (err, data) => {
    if (err) return res.status(500).json(err); // Handle server errors
    if (data.length === 0) return res.status(401).json("Invalid credentials"); // No match found
    return res.json(data[0]); // Return the admin data with role
  });
});

// Get all cloth items
app.get("/cloth", (req, res) => {
  const q = `
    SELECT c.Cloth_ID, c.Cloth_Name, c.Cloth_photo, c.Cloth_color, c.Price
    FROM cloth c
  `;
  db.query(q, (err, data) => {
    if (err) return res.json(err);
    return res.json(data);
  });
});

app.get("/clothList", (req, res) => {
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
app.post("/cloth", (req, res) => {
  const q =
    "INSERT INTO cloth (`Cloth_Name`, `Cloth_photo`, `Cloth_color`, `Price`, `Type_id`) VALUES (?)";
  const values = [
    req.body.Cloth_Name,
    req.body.Cloth_photo,
    req.body.Cloth_color,
    req.body.Price,
    req.body.Type_id || 1, // Default Type_id to 1 if not provided
  ];

  db.query(q, [values], (err, data) => {
    if (err) return res.status(500).json(err);
    return res.status(201).json("Cloth item has been added successfully.");
  });
});

// Delete a cloth item
app.delete("/cloth/:id", (req, res) => {
  const clothId = req.params.id;
  const q = " DELETE FROM cloth WHERE Cloth_ID = ? ";

  db.query(q, [clothId], (err, data) => {
    if (err) return res.send(err);
    return res.json(data);
  });
});

// Get a cloth item by ID
app.post("/api/users", (req, res) => {
  const { user_name, user_surname, user_password } = req.body;

  // Ensure all required fields are provided
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
// Update a cloth item
app.put("/cloth/:id", (req, res) => {
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

// Start the server
app.listen(3000, () => {
  console.log("Backend server is running on port 3000");
});
