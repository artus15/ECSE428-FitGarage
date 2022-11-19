import React from "react";
import './NavbarStyles.css';
import { useNavigate, Routes, Route } from "react-router-dom";
import { Signup } from "../Signup/Signup.js";
import { Login } from "../Login/Login.js";

const Navbar=() => {
    const navigate = useNavigate();

    const navigateSignUp = () => {
        // 👇️ navigate to /
        navigate('/signup');
      };

    return (
        <div className="navbar">
            <div className="container">
                
                <ul className="nav-menu">
                    <button onClick={navigateSignUp}> SIGN UP/LOGIN</button>

                </ul>
            </div>
        </div>
    )
}

export default Navbar