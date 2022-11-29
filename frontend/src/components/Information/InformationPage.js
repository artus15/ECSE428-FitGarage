import React from "react";
import "./InformationPage.css";
import { useNavigate } from "react-router-dom";

export const InformationPage = () => {
	const navigate = useNavigate();

    const navigateHomepage = () => {
		// 👇️ navigate to /
		navigate("/");
	};	

    //dummy variables
    let judodescription= "Judo classes teach students how to use the indirect application of force to defeat an opponent. Judo lessons practice how to use the strength of an opponent's against them. The object is to either throw or takedown one's opponent to the ground, immobilise or otherwise subdue an opponent with a grappling manoeuvre.";
    let tyogadescription= "Therapeutic yoga classes are gentle and include yoga poses modified to individual’s needs, gentle movement sequences to help improve the body’s movement patterns, yogic breath techniques, and guided relaxation.  Each class is structured to address a region or system of the body that may need balancing for better health and well being.";

    let gymclass1="Judo";

    let gymclass2="Yoga";

    let gymclass3="Fitness";

	return (

		<div>
			<div className="informationpage">
				<div className="content">
                    <div className="header">
                    <h2>CLASSES OFFERED AT FIT GARAGE</h2>
                    </div>
                    <div className="course">

                        <div className="courseinfo">
                            <strong>Class: {gymclass1}</strong>
                            <p>{judodescription}</p>
                        </div>
                    </div>

                    <div className="course">
                        <div className="courseinfo">
                            <strong>Class: {gymclass2}</strong>
                            <p>{tyogadescription}</p>
                        </div>
                    </div>
                    <button onClick={navigateHomepage}> BACK</button>

				</div>
			</div>
		</div>
	);
};
