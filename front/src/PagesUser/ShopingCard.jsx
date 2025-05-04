import React, { useState } from "react";
import { useNavigate } from "react-router-dom"; // Import useNavigate for navigation
import "./ShopingCard.css"; // Import the CSS file for styling
import Navbar from "../Conponents/NavBarUser";
import Footer from "../Conponents/Footer";

const ShopingCard = () => {
  const [showPopup, setShowPopup] = useState(false);
  const navigate = useNavigate(); // Initialize useNavigate

  const handleConfirm = () => {
    setShowPopup(true); // Show the popup
    setTimeout(() => {
      setShowPopup(false); // Hide the popup after 3 seconds
      navigate("/clothes-user-list"); // Navigate to clothing list page
    }, 3000);
  };

  const handleCancel = () => {
    navigate("/clothes-user-list"); // Navigate to clothing list page immediately
  };

  return (
    <div className="shopping-card-page">
      <Navbar />

      {/* Hero Section */}
      <div className="hero-section">
        <h1>Shopping Cart</h1>
        <p>Confirm your purchase below.</p>
      </div>

      {/* Confirmation Section */}
      <div className="confirmation-section">
        <h2>Do you really want to buy this product?</h2>
        <div className="buttons">
          <button className="confirm-button" onClick={handleConfirm}>
            Yes, Buy Now
          </button>
          <button className="cancel-button" onClick={handleCancel}>
            Cancel
          </button>
        </div>
      </div>

      {/* Popup */}
      {showPopup && (
        <div className="popup">
          <p>Thank you for purchasing!</p>
        </div>
      )}

      <Footer />
    </div>
  );
};

export default ShopingCard;
