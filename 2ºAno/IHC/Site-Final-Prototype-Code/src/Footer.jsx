import React from 'react';
import './Footer.css';

import Adidas_Logo from './imagens/Adidas_Logo.png';
import Puma_Logo from './imagens/Puma_Logo.png';


const Footer = () => {
  return (
    <footer className="footer">
      <div className="footer-content">
        <div className="footer-text">
          <p>&copy; 2023 Athlete Profile. All rights reserved.</p>
          <nav className="footer-navigation">
            <a >Sobre</a>
            <a >Contactos</a>
            <a >Politica de privacidade</a>
            {/* <a href="/terms">Terms of Service</a> */}
          </nav>
        </div>
        <div className="patrons-logos">
          <img src={Adidas_Logo} alt="Adidas" className="logo" />
          <img src={Puma_Logo} alt="Puma" className="logo" />
        </div>
      </div>
    </footer>
  );
};

export default Footer;