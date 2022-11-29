import React from "react";
import "./DashboardPage.css";
import { useNavigate } from "react-router-dom";
export const DashboardPage = () => {

    const navigate = useNavigate();

    const navigateHomepage = () => {
		// 👇️ navigate to /
		navigate("/");
	};	

    const navigateBooking = () => {
		// 👇️ navigate to /
		navigate("/booking");
	};	

    const navigateInformation = () => {
		// 👇️ navigate to /
		navigate("/information");
	};	

    //dummy variables
    let instructor1="Sally";
    let gymclass1="Judo";
    

	return (

		<div>
			<div className="dashboardpage">
				<div className="content">
                    <div className="mynavbar">
                        <button onClick={navigateInformation}>INFORMATION</button>
                        <button onClick={navigateBooking}> BOOKING</button>
                        <button onClick={navigateHomepage}> SIGN OUT</button>
                    </div>
                    <div className="header">
                    <h1>MY CLASSES</h1>
                    </div>
                    <div className="course">

                        <div className="courseinfo">
                            <strong>Class: {gymclass1}</strong>
                            <p>Instructor: {instructor1}</p>
                            <p>Fridays from 3:30 to 5:30</p>
                        </div>

                    </div>
				</div>
			</div>
		</div>
	);
};

