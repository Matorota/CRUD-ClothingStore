import React, { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";

const UserLogin = () => {
  const [credentials, setCredentials] = useState({
    User_name: "",
    User_surname: "",
    User_password: "",
  });
  const [error, setError] = useState("");
  const navigate = useNavigate();

  const handleChange = (e) => {
    setCredentials({ ...credentials, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const res = await axios.post(
        "http://localhost:3000/login-user",
        credentials
      );
      const { role } = res.data;

      if (role === "user") {
        navigate("/user-main"); // Redirect to User Main page
      } else if (role === "admin") {
        navigate("/main"); // Redirect to Admin Main page
      }
    } catch (err) {
      setError("Invalid name, surname, or password");
    }
  };

  return (
    <div style={styles.container}>
      <h1 style={styles.title}>Login User</h1>
      <form onSubmit={handleSubmit} style={styles.form}>
        <input
          type="text"
          name="User_name"
          placeholder="Name"
          value={credentials.User_name}
          onChange={handleChange}
          style={styles.input}
        />
        <input
          type="text"
          name="User_surname"
          placeholder="Surname"
          value={credentials.User_surname}
          onChange={handleChange}
          style={styles.input}
        />
        <input
          type="password"
          name="User_password"
          placeholder="Password"
          value={credentials.User_password}
          onChange={handleChange}
          style={styles.input}
        />
        {error && <p style={styles.error}>{error}</p>}
        <button type="submit" style={styles.button}>
          Login
        </button>
      </form>
    </div>
  );
};

const styles = {
  container: {
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "center",
    height: "100vh",
    backgroundColor: "#f4f4f9",
  },
  title: {
    fontSize: "2rem",
    color: "#333",
    marginBottom: "20px",
  },
  form: {
    display: "flex",
    flexDirection: "column",
    gap: "15px",
    width: "300px",
  },
  input: {
    padding: "10px",
    fontSize: "1rem",
    border: "1px solid #ccc",
    borderRadius: "5px",
    outline: "none",
  },
  error: {
    color: "red",
    fontSize: "0.9rem",
    textAlign: "center",
  },
  button: {
    padding: "10px 20px",
    fontSize: "1rem",
    fontWeight: "bold",
    color: "white",
    backgroundColor: "#007bff",
    border: "none",
    borderRadius: "5px",
    cursor: "pointer",
    transition: "background-color 0.3s ease",
  },
};

export default UserLogin;
