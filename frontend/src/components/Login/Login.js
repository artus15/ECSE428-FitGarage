import { useState } from "react";
import { useNavigate } from "react-router-dom";
import styles from "./style.module.css";

export const Login = () => {
	const [email, setEmail] = useState("");
	const [password, setPassword] = useState("");

	const navigate = useNavigate();

	const navigateSignUp = () => {
		navigate("/signup");
	};

	const login = () => {
		console.log("login");
	};

	return (
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
						Log In
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
						placeholder="Email"
						value={email}
						onChange={(e) => setEmail(e.target.value)}
					/>
					<input
						className={styles.input}
						type="password"
						placeholder="Password"
						value={password}
						onChange={(e) => setPassword(e.target.value)}
					/>
				</div>
				<div>
					<button
						onClick={login}
						style={{
							backgroundColor: "orange",
							paddingLeft: "1rem",
							paddingRight: "1rem",
							paddingTop: "0.5rem",
							paddingBottom: "0.5rem",
							borderRadius: "0.5rem",
						}}
					>
						Log in
					</button>
				</div>
				<div>
					<button
						style={{
							border: "none",
							backgroundColor: "transparent",
						}}
						onClick={navigateSignUp}
					>
						<text style={{ color: "orange" }}>
							Click here to sign up
						</text>
					</button>
				</div>
			</div>
		</div>
	);
};
