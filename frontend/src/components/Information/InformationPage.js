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
    let kickboxingdescription="This class will keep you on your toes. This class combines cardio kickboxing, bag training and strength training to give you a total body workout. This high energy class will push you to reach new levels of fitness training. Challenge yourself to train your body like you’ve never done before!";

    let gymclass1="Judo";

    let gymclass2="Yoga";

    let gymclass3="Kickboxing";

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

                    <div className="course">
                        <div className="courseinfo">
                            <strong>Class: {gymclass3}</strong>
                            <p>{kickboxingdescription}</p>
                        </div>
                    </div>
                    {/* <button onClick={navigateHomepage}> BACK</button> */}

				</div>
			</div>
		</div>
	);
};
