import React, {Component} from "react";
import './HomePageStyles.css';
import Navbar from "../navbar/Navbar.js";
const HomePage = () => {
    return (
        <div><Navbar />
        <div className="homepage">
            <div className="content">
            
                <h1>FIT GARAGE</h1>

                <h2>RISE TO THE CHALLENGE</h2>
                </div>
            </div>
        </div>
    )
}

export default HomePage