import React, { useState } from "react";
import { useNavigate } from "react-router-dom";
import "./RegisterUser.css"; // Import the CSS file for styling

const RegisterUser = () => {
  const [formData, setFormData] = useState({
    user_name: "",
    user_surname: "",
    user_password: "",
  });
  const navigate = useNavigate();

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const response = await fetch("http://localhost:3000/api/users", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify(formData),
      });
      if (response.ok) {
        alert("User registered successfully!");
        setFormData({ user_name: "", user_surname: "", user_password: "" });
      } else {
        alert("Failed to register user.");
      }
      navigate("/");
    } catch (error) {
      console.error("Error:", error);
      alert("An error occurred while registering the user.");
    }
  };

  return (
    <div className="register-container">
      <h2>Register User</h2>
      <form onSubmit={handleSubmit} className="register-form">
        <div className="form-group">
          <label>First Name:</label>
          <input
            type="text"
            name="user_name"
            value={formData.user_name}
            onChange={handleChange}
            required
          />
        </div>
        <div className="form-group">
          <label>Last Name:</label>
          <input
            type="text"
            name="user_surname"
            value={formData.user_surname}
            onChange={handleChange}
            required
          />
        </div>
        <div className="form-group">
          <label>Password:</label>
          <input
            type="password"
            name="user_password"
            value={formData.user_password}
            onChange={handleChange}
            required
          />
        </div>
        <div className="button-group">
          <button type="submit" className="btn-primary">
            Register
          </button>
          <button
            type="button"
            className="btn-secondary"
            onClick={() => navigate("/")}
          >
            Back
          </button>
        </div>
      </form>
    </div>
  );
};

export default RegisterUser;
