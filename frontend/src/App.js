import React, { useState, useEffect, Component } from 'react';
import logo from './logo.svg';
import './App.css';
import axios from "axios";

class App extends Component {
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
      .get("/api/classes/")
      .then((res) => this.setState({ classList: res.data }))
      .catch((err) => console.log(err));
  };
  
  render() {
    return (
      <div>
        <p>
          Existing classes: {this.state.classList}
        </p>
      </div>
    )
  }

}

export default App;
