import logo from "./logo.svg";
import "./App.css";
import * as React from "react";
import Button from "@mui/material/Button";
import SignIn from "./components/Auth/SignIn";
import SignUp from "./components/Auth/Signup";

function App() {
  console.log("hello")
  return (
    <div className="App">
      <SignIn/>
    </div>
  );
}

export default App;
