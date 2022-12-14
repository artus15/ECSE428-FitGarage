import React from "react";
// import logo from "./logo.svg";
import "./App.css";

// import axios from "axios";

import HomePage from "./components/Home/HomePage.js";
// import Navbar from "./components/navbar/Navbar.js";

import { Routes, Route } from "react-router-dom";
import { Signup } from "./components/Signup/Signup.js";
import { Login } from "./components/Login/Login.js";

import {BookingPage} from "./components/Booking/BookingPage.js";
import {InformationPage} from "./components/Information/InformationPage.js";
import {DashboardPage} from "./components/Dashboard/DashboardPage.js";

//import {Route, Switch} from 'react-router';

function App() {
	return (
		<div>
			<Routes>
				<Route path="/" element={<HomePage />}></Route>
				<Route path="/signup" element={<Signup />}></Route>
				<Route path="/login" element={<Login />}></Route>
        <Route path="/booking" element={<BookingPage />}></Route>
        <Route path="/information" element={<InformationPage />}></Route>
        <Route path="/dashboard" element={<DashboardPage />}></Route>
			</Routes>
		</div>
	);
}

export default App;

//someone else left these, not Kachi
/*
  constructor(props) {
    super(props);
    this.state = {
      classList: []
    }
  } 



  // example request
  componentDidMount() {
    this.refreshList();
  }

  refreshList = () => {
    axios
      .get("http://127.0.0.1:8000/user/getUserInfo")
      .then((res) => this.setState({ Users: res }))
      .catch((err) => console.log(err));
  };
*/
