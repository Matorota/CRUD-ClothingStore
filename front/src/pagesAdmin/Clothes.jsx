import React, { useState, useEffect } from "react";
import axios from "axios";
import { Link } from "react-router-dom";
import Navbar from "../Conponents/NavBar";
import Footer from "../Conponents/Footer";

const Clothes = () => {
  const [clothes, setClothes] = useState([]);

  useEffect(() => {
    const fetchAllClothes = async () => {
      try {
        const res = await axios.get("http://localhost:3000/cloth");
        setClothes(res.data);
      } catch (err) {
        console.error(err);
      }
    };

    fetchAllClothes();
  }, []);

  const handleDelete = async (id) => {
    try {
      await axios.delete(`http://localhost:3000/cloth/${id}`);
      setClothes(clothes.filter((item) => item.Cloth_ID !== id));
    } catch (err) {
      console.error(err);
    }
  };

  return (
    <div>
      <Navbar />

      <div className="clothes flex flex-wrap gap-4 bg-blue-500">
        {clothes.map((item) => (
          <div className="clothing-item" key={item.Cloth_ID}>
            {item.Cloth_photo && (
              <img
                src={item.Cloth_photo}
                alt={item.Cloth_Name}
                style={{ width: "150px" }}
              />
            )}
            <h2>{item.Cloth_Name}</h2>
            <p>Color: {item.Cloth_color}</p>
            <p>Price: ${item.Price}</p>
            <button
              className="delete"
              onClick={() => handleDelete(item.Cloth_ID)}
            >
              Delete
            </button>
            <button className="update">
              <Link to={`/update/${item.Cloth_ID}`}>Update</Link>
            </button>
          </div>
        ))}
      </div>
      <button>
        <Link to="/add">Add New Cloth</Link>
      </button>
      <Footer />
    </div>
  );
};

export default Clothes;
