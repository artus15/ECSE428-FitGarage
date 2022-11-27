import React from "react";
import "./BookingPage.css";
export const BookingPage = () => {

    function sayJoined() {
        alert('You have joined the class!');
    }

    let instructor1="Sally";
    let gymclass1="Judo";

    let instructor2="Jean";
    let gymclass2="Yoga";

	return (

		<div>
			<div className="bookingpage">
				<div className="content">
                    <div className="header">
                    <h1>AVAILABLE COURSES</h1>
					<h3>Click the JOIN button to book the class!</h3>
                    </div>
                    <div className="course">

                        <div className="courseinfo">
                            <strong>Class: {gymclass1}</strong>
                            <p>Instructor: {instructor1}</p>
                        </div>
                        <div className="mybutton">
                        <button onClick={sayJoined}>JOIN</button>
                        </div>
                    </div>

                    <div className="course">

                    <div className="courseinfo">
                        <strong>Class: {gymclass2}</strong>
                        <p>Instructor: {instructor2}</p>
                    </div>
                    <div className="mybutton">
                    <button onClick={sayJoined}>JOIN</button>
                    </div>
                    </div>


				</div>
			</div>
		</div>
	);
};

// export default BookingPage;
