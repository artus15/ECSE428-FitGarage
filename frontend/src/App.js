import React, { useState, useEffect, Component } from 'react';
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
      .get("http://127.0.0.1:8000/user/getUserInfo")
      .then((res) => this.setState({ Users: res }))
      .catch((err) => console.log(err));
  };
  
  render() {
    return (
      <div>
        <p>
          Hello World
        </p>
      </div>
    )
  }

};


  // axios
  //     .get("http://127.0.0.1:8000/user/getUserInfo")
  //     .then((res) => console.log(res))
  //     .catch((err) => console.log(err));


export default App;
