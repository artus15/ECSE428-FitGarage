import React from "react";
import "./NavbarStyles.css";
import { useNavigate } from "react-router-dom";
// import { Signup } from "../Signup/Signup.js";
// import { Login } from "../Login/Login.js";

const Navbar = () => {
	const navigate = useNavigate();

	const navigateSignUp = () => {
		// 👇️ navigate to /
		navigate("/signup");
	};

	const navigateInformation = () => {
		// 👇️ navigate to /
		navigate("/information");
	};	


	return (
		<div className="navbar">
			<div className="container">
				<ul className="nav-menu">
					<button onClick={navigateInformation}>INFORMATION</button>
					<button onClick={navigateSignUp}> SIGN UP/LOGIN</button>
				</ul>
			</div>
		</div>
	);
};

export default Navbar;
