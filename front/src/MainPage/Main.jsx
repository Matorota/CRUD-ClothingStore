import React from "react";
import Navbar from "../Conponents/NavBar";
import Footer from "../Conponents/Footer";
import "./Main.css"; // Import your CSS file for styling

const AdminMain = () => {
  return (
    <div>
      <Navbar />
      <section className="hero">
        <h2>Welcome to Navaro Clothing Store</h2>
        <p className="hero-description">
          Discover the latest trends in fashion and shop for high-quality
          clothing that suits your style. From casual wear to formal attire, we
          have it all!
        </p>
        <div className="about-section">
          <div className="about-block">
            <img
              src="https://images.pexels.com/photos/31890680/pexels-photo-31890680/free-photo-of-woman-in-white-dress-surrounded-by-monstera-leaves.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
              alt="Fashion Showcase"
              className="about-image"
            />
            <div className="about-text">
              <h3>Why Choose Navaro Clothing?</h3>
              <p>
                At Navaro Clothing Store, we believe that fashion is for
                everyone. Our mission is to provide high-quality, stylish, and
                affordable clothing that makes you feel confident and
                comfortable. Whether you're looking for everyday essentials or
                statement pieces, we've got you covered.
              </p>
            </div>
          </div>

          <div className="about-block reverse">
            <div className="about-text">
              <h3>Our Commitment to Sustainability</h3>
              <p>
                We care about the planet. That's why we use sustainable
                materials and ethical practices in our production process. By
                choosing Navaro Clothing, you're supporting a greener future
                while staying stylish.
              </p>
            </div>
            <img
              src="https://images.pexels.com/photos/2983465/pexels-photo-2983465.jpeg?auto=compress&cs=tinysrgb&w=600"
              alt="Sustainable Fashion"
              className="about-image"
            />
          </div>
          <a href="/clothes" className="cta-button">
            Explore Our Collection
          </a>
        </div>
      </section>
      <Footer />
    </div>
  );
};

export default AdminMain;
