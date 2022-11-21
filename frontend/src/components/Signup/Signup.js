import { useState } from "react";
import { useNavigate } from "react-router-dom";
import styles from "./style.module.css";

export const Signup = () => {
	const [username, setUsername] = useState("");
	const [email, setEmail] = useState("");
	const [password, setPassword] = useState("");

	const navigate = useNavigate();

	const navigateLogIn = () => {
		navigate("/login");
	};

	return (
		<div>
			<div
				style={{
					background: "black",
					height: "100%",
					width: "100%",
					position: "absolute",
				}}
			>
				<div
					style={{
						display: "flex",
						justifyContent: "center",
						alignItems: "center",
						flexDirection: "column",
						padding: "10rem",
					}}
				>
					<div>
						<text style={{ color: "orange", fontSize: "5rem" }}>
							Sign Up
					</text>
					</div>
					<div
						style={{
							display: "flex",
							flexDirection: "column",
							padding: "1rem",
						}}
					>
						<input
							className={styles.input}
							type="text"
							placeholder="Username"
							value={username}
							onChange={(e) => setUsername(e.target.value)}
						/>
						<input
							className={styles.input}
							type="text"
							placeholder="Email"
							value={email}
							onChange={(e) => setEmail(e.target.value)}
						/>
						<input
							className={styles.input}
							type="text"
							placeholder="Password"
							value={password}
							onChange={(e) => setPassword(e.target.value)}
						/>
					</div>
					<div>
						<button
							onClick={Signup}
							style={{
								backgroundColor: "orange",
								paddingLeft: "1rem",
								paddingRight: "1rem",
								paddingTop: "0.5rem",
								paddingBottom: "0.5rem",
								borderRadius: "0.5rem",
							}}
						>
							Sign up
					</button>
					</div>
					<div>
						<button
							style={{
								border: "none",
								backgroundColor: "transparent",
							}}
							onClick={navigateLogIn}
						>
							<text style={{ color: "orange" }}>
								Click here to log in
						</text>
						</button>
					</div>
				</div>
			</div>
			<h1>YES</h1>
			<button onClick={navigateLogIn}>
				Already have an account? Log in here
			</button>
		</div>
		
	);
};
