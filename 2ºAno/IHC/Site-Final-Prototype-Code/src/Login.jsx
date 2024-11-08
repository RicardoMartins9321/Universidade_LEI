import React, {useState} from "react";
import { Link, useNavigate } from "react-router-dom";

import "bootstrap/dist/css/bootstrap.min.css";
import '@fortawesome/fontawesome-free/css/all.min.css';
import "./Login.css";

import TheNavBar from "./TheNavBar";
import Footer from "./Footer";


function Login() {
  const navigate = useNavigate(); // Corrected the typo in the variable name
  const [showPassword, setShowPassword] = useState(false);

  function getMail() {
    return document.getElementById("inputEmail").value;
  }

  function getPassword() {
    return document.getElementById("inputPassword").value;
  }

  function checkMailAndPass(event) {
    event.preventDefault(); // Prevents form submission and page reload
    let listClients = JSON.parse(localStorage.getItem("Lista_clients")) || [];
    for (let index = 0; index < listClients.length; index++) {
      const dictionary = listClients[index];

      if (dictionary.email === getMail()) {
        if (dictionary.password === getPassword()) {
          alert("Login efetuado com sucesso!");
          sessionStorage.setItem("Login", JSON.stringify(dictionary));
          navigate("/");
          return;
        } else {
          alert("Password errada");
          return;
        }
      }
    }
    alert("Email não encontrado");
  }

  return (
    <div className="form-bg d-flex flex-column min-vh-100">
      <TheNavBar />
      <div className="container flex-grow-1 d-flex justify-content-center align-items-center">
        <div className="form-container">
          <h3 className="title">My Account</h3>
          <form className="form-horizontal" onSubmit={checkMailAndPass}>
            <div className="form-icon">
              <i className="fa fa-user-circle"></i>
            </div>
            <div className="form-group">
              <span className="input-icon"><i className="fa fa-user"></i></span>
              <input type="email" id="inputEmail" className="form-control" placeholder="Email" required />
            </div>
            <div className="form-group position-relative">
              <span className="input-icon"><i className="fa fa-lock"></i></span>
              <input
                type={showPassword ? "text" : "password"}
                id="inputPassword"
                className="form-control"
                placeholder="Password"
                required
              />
              <button
                type="button"
                className="btn toggle-password"
                onClick={() => setShowPassword(!showPassword)}
              >
                <i className={`fa ${showPassword ? "fa-unlock" : "fa-lock"}`} />
              </button>
              <span className="forgot"><a href="/">Forgot Password?</a></span>
            </div>
            <button type="submit" className="btn signin">Login</button>
          </form>
          <div className="register-link mt-3">
            <Link to="/register">Don't have an account? Register here</Link>
          </div>
        </div>
      </div>
      <Footer />
    </div>
  );
}

export default Login;
