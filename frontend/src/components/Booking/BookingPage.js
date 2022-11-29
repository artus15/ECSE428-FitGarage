import React from "react";
import "./BookingPage.css";
import { useNavigate } from "react-router-dom";
export const BookingPage = () => {

    function sayJoined() {
        alert('You have joined the class!');
    }
    const navigate = useNavigate();
    //Must be changed to go to a dashboard page or something like that.

    const navigateDashboard = () => {
		// 👇️ navigate to /
		navigate("/dashboard");
	};	

    //dummy variables
    let instructor1="Sally";
    let gymclass1="Judo";

    let instructor2="Jean";
    let gymclass2="Yoga";

    let instructor3="Liam";
    let gymclass3="Fitness";
    

	return (

		<div>
			<div className="bookingpage">
				<div className="content">
                    <div className="header">
                    <h1>AVAILABLE CLASSES</h1>
					<h4>Click the JOIN button to book the class!</h4>
                    </div>
                    <div className="course">

                        <div className="courseinfo">
                            <strong>Class: {gymclass1}</strong>
                            <p>Instructor: {instructor1}</p>
                        </div>
                        <button onClick={sayJoined}>JOIN</button>

                    </div>

                    <div className="course">

                        <div className="courseinfo">
                            <strong>Class: {gymclass2}</strong>
                            <p>Instructor: {instructor2}</p>
                        </div>
                        <button onClick={sayJoined}>JOIN</button>

                        
                    </div>

                    <div className="course">

                        <div className="courseinfo">
                            <strong>Class: {gymclass3}</strong>
                            <p>Instructor: {instructor3}</p>
                        </div>
                        <button onClick={sayJoined}>JOIN</button>
                        
                    </div>

                    <button className="backbutton" onClick={navigateDashboard}> BACK</button>

				</div>
			</div>
		</div>
	);
};

// export default BookingPage;
