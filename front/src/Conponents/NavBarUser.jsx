import React from "react";
import "./NavBar.css"; // Import your CSS file for styling
import logo from "../assets/logo.png"; // Adjust the path to your actual logo file

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
        <a href="/user-main">Home</a>
        <a href="/clothes-user-list">Shoping</a>
        <a href="/contacts">Contacts</a>
        <a href="/permision">Permissions</a>
        <a href="/">Log out</a>
      </div>
    </header>
  );
};

export default Navbar;
