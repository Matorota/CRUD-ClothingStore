import React from "react";
import "./Permission.css"; // Import the CSS file for styling
import Navbar from "../Conponents/NavBarUser";
import Footer from "../Conponents/Footer";

const Permission = () => {
  const handleSubmit = (e) => {
    e.preventDefault(); // Prevent the default form submission behavior
    alert("Permission request submitted successfully!"); // Display the success popup
  };

  return (
    <div className="permission-page">
      <Navbar />

      {/* Hero Section */}
      <div className="hero-section">
        <h1>Request Permission</h1>
        <p>Fill out the form below to request access to get seller account.</p>
      </div>

      {/* Permission Form Section */}
      <div className="permission-form-section">
        <h2>Permission Request Form</h2>
        <form className="permission-form" onSubmit={handleSubmit}>
          <input type="text" placeholder="Your Name" required />
          <input type="email" placeholder="Your Email" required />
          <input type="text" placeholder="Permission Type" required />
          <textarea
            placeholder="Reason for Request"
            rows="5"
            required
          ></textarea>
          <button type="submit">Submit Request</button>
        </form>
      </div>

      {/* Info Section */}
      <div className="info-section">
        <h2>Need Help?</h2>
        <p>
          If you have any questions about permissions, feel free to contact us
          at{" "}
          <a href="mailto:permissions@betterclothes.com">
            permissions@betterclothes.com
          </a>
          .
        </p>
      </div>

      <Footer />
    </div>
  );
};

export default Permission;
