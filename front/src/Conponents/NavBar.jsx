import React from "react";
import logo from "../assets/logo.png"; // Adjust the path to your actual logo file
import "./NavBar.css"; // Import your CSS file for styling

const Navbar = () => {
  return (
    <header className="navbar">
      <img
        src={logo} // Use the imported logo file
        alt="Navaro Logo"
        className="logo"
        href="/main"
      />

      <div className="nav-links">
        <a href="/main">Home</a>
        <a href="/clothes">Clothes</a>
        <a href="/add">Add Clothes</a>
        <a href="/">Log out</a>
      </div>
    </header>
  );
};

export default Navbar;
