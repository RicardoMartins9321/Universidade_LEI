import React from "react";
import { useState } from "react";
import { Link, useNavigate } from "react-router-dom";

import "bootstrap/dist/css/bootstrap.min.css";
import '@fortawesome/fontawesome-free/css/all.min.css';
import "./Login.css";

import TheNavBar from "./TheNavBar";
import Footer from "./Footer";


function Register() {
  //console.log(localStorage.getItem('Lista_clients'));

  const navigate = useNavigate();
  function RegisterInStorage(formData) {
    const existingClients = JSON.parse(localStorage.getItem("Lista_clients")) || [];
    localStorage.setItem("Lista_clients", JSON.stringify([...existingClients, formData]));
    sessionStorage.setItem("Login", JSON.stringify(formData));
  }

  const [validated, setValidated] = useState(false);

  const handleSubmit = (event) => {
    const form = event.currentTarget;
    if (!form.checkValidity()) {
      event.preventDefault();
      event.stopPropagation();
    } else {
      const formData = {
        name: form.querySelector("#name").value,
        district: form.querySelector("#district").value,
        email: form.querySelector("#inputEmail").value,
        password: form.querySelector("#password").value,
        IsClube: form.querySelector("#IsClub").value==="Clube",
      };
      RegisterInStorage(formData);
      navigate("/");
    }

    setValidated(true);
  };

  return (
    <div className="form-bg d-flex flex-column min-vh-100">
      <TheNavBar />
      <div className="container flex-grow-1 d-flex justify-content-center align-items-center">
        <div className="form-container">
          <h3 className="title">Register</h3>
          <form className={`form-horizontal ${validated ? "was-validated" : ""}`} noValidate onSubmit={handleSubmit}>

            <div className="form-icon">
              <i className="fa fa-user-circle"></i>
            </div>
            <div className="form-group">
              <span className="input-icon"><i className="fa fa-user"></i></span>
              <input type="text" id="name" className="form-control" placeholder="Name" required />
              <div className="invalid-feedback">Please enter a name.</div>
            </div>
            <div className="form-group">
              <span className="input-icon"><i className="fa fa-map-marker-alt"></i></span>
              <select id="district" className="form-control" required>
                <option selected disabled value="">Select District</option>
                <option value="Aveiro">Aveiro</option>
                <option value="Beja">Beja</option>
                <option value="Braga">Braga</option>
                <option value="Bragança">Bragança</option>
                <option value="Castelo Branco">Castelo Branco</option>
                <option value="Coimbra">Coimbra</option>
                <option value="Évora">Évora</option>
                <option value="Faro">Faro</option>
                <option value="Guarda">Guarda</option>
                <option value="Leiria">Leiria</option>
                <option value="Lisboa">Lisboa</option>
                <option value="Portalegre">Portalegre</option>
                <option value="Porto">Porto</option>
                <option value="Santarém">Santarém</option>
                <option value="Setúbal">Setúbal</option>
                <option value="Viana do Castelo">Viana do Castelo</option>
                <option value="Vila Real">Vila Real</option>
                <option value="Viseu">Viseu</option>
              </select>
              <div className="invalid-feedback">Please select a district.</div>
            </div>
            <div className="form-group">
              <span className="input-icon"><i className="fa fa-map-marker-alt"></i></span>
              <select id="IsClub" className="form-control" required>
                <option selected disabled value="">Select account type</option>
                <option value="Clube">Clube</option>
                <option value="Atleta">Atleta</option>
              </select>
              <div className="invalid-feedback">Please select a district.</div>
            </div>
            <div className="form-group">
              <span className="input-icon"><i className="fa fa-envelope"></i></span>
              <input type="email" id="inputEmail" className="form-control" placeholder="Email" required />
              <div className="invalid-feedback">Please enter a valid email address.</div>
            </div>
            <div className="form-group">
              <span className="input-icon"><i className="fa fa-lock"></i></span>
              <input type="password" id="password" className="form-control" placeholder="At least 8 characters" required minLength={8} />
              <div className="invalid-feedback">Password must be at least 8 characters long.</div>
            </div>
            <div className="form-group">
              <input type="checkbox" id="termsCheck" required />
              <label htmlFor="termsCheck">Agree to terms and conditions</label>
              <div className="invalid-feedback">You must agree before submitting.</div>
              <span className="forgot"><Link to="/terms">Check Terms</Link></span>
            </div>
            <button type="submit" className="btn signin">Register</button>
          </form>
          <div className="register-link">
            <Link to="/login">Already have an account? Login here</Link>
          </div>
        </div>
      </div>
      <Footer />
      <style jsx>{`
        body {
          background-color: #ffe9e0;
        }
      `}</style>
    </div>

  );
}

export default Register;
