import { useNavigate } from "react-router-dom";

export const Signup = () => {
	const navigate = useNavigate();

	const navigateSignUp = () => {
		navigate("/login");
	};

	return (
		<div>
			<h1>YES</h1>
			<button onClick={navigateSignUp}>
				Already have an account? Log in here
			</button>
		</div>
	);
};
