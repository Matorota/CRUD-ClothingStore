import React, { useState, useEffect } from "react";
import axios from "axios";
import { useNavigate, useParams } from "react-router-dom";
import Navbar from "../Conponents/NavBar";
import Footer from "../Conponents/Footer";
import "./Update.css"; // Import the CSS file for styling

const Update = () => {
  const { id } = useParams();
  const [cloth, setCloth] = useState({
    Cloth_Name: "",
    Cloth_photo: "",
    Cloth_color: "",
    Price: "",
  });
  const navigate = useNavigate();

  useEffect(() => {
    const fetchCloth = async () => {
      try {
        const res = await axios.get(`http://localhost:3000/cloth/${id}`);
        setCloth(res.data);
      } catch (err) {
        console.error(err);
      }
    };

    fetchCloth();
  }, [id]);

  const handleChange = (e) => {
    setCloth({ ...cloth, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      await axios.put(`http://localhost:3000/cloth/${id}`, cloth);
      navigate("/clothes");
    } catch (err) {
      console.error(err);
    }
  };

  return (
    <div className="update-page">
      <Navbar />
      <div className="update-container">
        <h1>Update Cloth</h1>
        <form className="update-form" onSubmit={handleSubmit}>
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
            Update Cloth
          </button>
        </form>
      </div>
      <Footer />
    </div>
  );
};

export default Update;
