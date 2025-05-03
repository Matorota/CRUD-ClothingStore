import React from "react";
import { useNavigate } from "react-router-dom";
import "./MainLG.css"; // Add some styling for the buttons

const MainLG = () => {
  const navigate = useNavigate();

  return (
    <div className="main-lg-container">
      <h1>Welcome to the Clothing App</h1>
      <div className="button-container">
        <button className="menu-button" onClick={() => navigate("/login")}>
          Login as Admin
        </button>
        <button className="menu-button" onClick={() => navigate("/login-user")}>
          Login as User
        </button>
        <button onClick={() => navigate("/register")}>Go to Register</button>
      </div>
    </div>
  );
};

export default MainLG;
