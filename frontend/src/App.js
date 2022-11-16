import React, { Component } from 'react';
import logo from './logo.svg';
import './App.css';
import axios from "axios";

import HomePage from './components/Home/HomePage';
import Navbar from './components/navbar/Navbar';

import {BrowserRouter,Routes, Route} from 'react-router-dom';
//import {Route, Switch} from 'react-router';


function App() {
  return (
    <div>
      <Navbar />
      <HomePage />
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
  } */


/* 
  // example request
  componentDidMount() {
    this.refreshList();
  }

  refreshList = () => {
    axios
      .get("/api/classes/")
      .then((res) => this.setState({ classList: res.data }))
      .catch((err) => console.log(err));
  };
  */