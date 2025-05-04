import React, { useState } from "react";
import axios from "axios";
import { useNavigate } from "react-router-dom";
import Navbar from "../Conponents/NavBar";
import Footer from "../Conponents/Footer";
import "./Add.css"; // Import the CSS file for styling

const Add = () => {
  const [cloth, setCloth] = useState({
    Cloth_Name: "",
    Cloth_photo: "",
    Cloth_color: "",
    Price: "",
    Type_id: 1, // Default Type_id set to 1
  });
  const navigate = useNavigate();

  const handleChange = (e) => {
    setCloth({ ...cloth, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.post("http://localhost:3000/cloth", cloth);
      navigate("/clothes"); // Redirect to the clothes page after adding
    } catch (err) {
      console.error(err);
    }
  };

  return (
    <div className="add-page">
      <Navbar />
      <div className="add-container">
        <h1>Add New Cloth</h1>
        <form className="add-form" onSubmit={handleSubmit}>
          <input
            type="text"
            placeholder="Name"
            name="Cloth_Name"
            value={cloth.Cloth_Name}
            onChange={handleChange}
            required
          />
          <input
            type="text"
            placeholder="Photo URL"
            name="Cloth_photo"
            value={cloth.Cloth_photo}
            onChange={handleChange}
            required
          />
          <input
            type="text"
            placeholder="Color"
            name="Cloth_color"
            value={cloth.Cloth_color}
            onChange={handleChange}
            required
          />
          <input
            type="number"
            placeholder="Price"
            name="Price"
            value={cloth.Price}
            onChange={handleChange}
            required
          />
          <button type="submit" className="submit-button">
            Add Cloth
          </button>
        </form>
      </div>
      <Footer />
    </div>
  );
};

export default Add;
