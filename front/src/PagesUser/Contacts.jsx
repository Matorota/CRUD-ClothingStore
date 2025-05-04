import React from "react";
import "./Contact.css"; // Import the CSS file for styling
import Navbar from "../Conponents/NavBarUser";
import Footer from "../Conponents/Footer";

const Contacts = () => {
  const handleSubmit = (e) => {
    e.preventDefault(); // Prevent the default form submission behavior
    alert("Message sent successfully!"); // Display the success popup
  };

  return (
    <div className="contacts-page">
      <Navbar />

      {/* Hero Section */}
      <div className="hero-section">
        <h1>Contact Us</h1>
        <p>We'd love to hear from you! Reach out to us anytime.</p>
      </div>

      {/* Contact Form Section */}
      <div className="contact-form-section">
        <h2>Get in Touch</h2>
        <form className="contact-form" onSubmit={handleSubmit}>
          <input type="text" placeholder="Your Name" required />
          <input type="email" placeholder="Your Email" required />
          <textarea placeholder="Your Message" rows="5" required></textarea>
          <button type="submit">Send Message</button>
        </form>
      </div>

      {/* Map Section */}
      <div className="map-section">
        <h2>Visit Us</h2>
        <iframe
          title="Google Map"
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2306.091292865847!2d25.26043931592644!3d54.68873418028179!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46dd9409e950027f%3A0x68c78a6b23ed30ea!2sVilniaus%20kolegija%2C%20Elektronikos%20ir%20informatikos%20fakultetas!5e0!3m2!1sen!2slt!4v1696600000000!5m2!1sen!2slt"
          width="100%"
          height="300"
          style={{ border: 0 }}
          allowFullScreen=""
          loading="lazy"
        ></iframe>
      </div>

      {/* Social Media Section */}
      <div className="social-media-section">
        <h2>Follow Us</h2>
        <div className="social-icons">
          <a
            href="https://facebook.com"
            target="_blank"
            rel="noopener noreferrer"
          >
            <img
              src="https://img.icons8.com/color/48/000000/facebook-new.png"
              alt="Facebook"
            />
          </a>
          <a
            href="https://twitter.com"
            target="_blank"
            rel="noopener noreferrer"
          >
            <img
              src="https://img.icons8.com/color/48/000000/twitter.png"
              alt="Twitter"
            />
          </a>
          <a
            href="https://instagram.com"
            target="_blank"
            rel="noopener noreferrer"
          >
            <img
              src="https://img.icons8.com/color/48/000000/instagram-new.png"
              alt="Instagram"
            />
          </a>
          <a
            href="https://linkedin.com"
            target="_blank"
            rel="noopener noreferrer"
          >
            <img
              src="https://img.icons8.com/color/48/000000/linkedin.png"
              alt="LinkedIn"
            />
          </a>
        </div>
      </div>
      <Footer />
    </div>
  );
};

export default Contacts;
