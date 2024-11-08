import FPANAV from "./imagens/FPANAV.png";
import SCP_logo from "./imagens/SCP_Logo.png";
import SCP_logo2 from "./imagens/SCP_Logo2.jpg";
import FPANAV2 from "./imagens/FPANAV2.png";
import PerfilImg from "./imagens/perfil.png";
import PerfilImg2 from "./imagens/perfil2.jpg";
import nextImg from "./imagens/next.PNG";
import Logo from "./imagens/Logo_2.jpg";
import Logo_noBackground from "./imagens/Logo_1_noBackground.png";
import { Link, useNavigate,useLocation } from "react-router-dom";
import { Container, Nav, Navbar, Button } from "react-bootstrap";
import { useState } from "react";


function TheNavBar() {
  const nave = useNavigate();
  const location = useLocation();
  const [isLoginDone, setLog] = useState(
    sessionStorage.getItem("Login") != null
  );
  const [IsClube, setIsClube] = useState(
    isLoginDone  ? JSON.parse(sessionStorage.getItem("Login")).IsClube:false
  );
  function BackButtonImg(path1){
   return (<Link to={path1}><img
      onMouseEnter={handleMouseEnter}
      onMouseLeave={handleMouseLeave}
      src={isHovered ? nextImg : nextImg}
      style={{ height: 60 ,paddingLeft:"10px"}}
      alt="Exemplo"
    /></Link>)
  }
  function BackButton(){
    var path1="/"
    
    if("/"===location.pathname){
      
      return 
    }
    if (!location.pathname.startsWith("/profile") && !location.pathname.startsWith("/club-profile")){
      sessionStorage.removeItem("Back")
    }
if (location.pathname.startsWith("/competions" )) {path1="/"}
if (location.pathname.startsWith("/competion/" )) {path1="/competions"}
if (location.pathname.startsWith("/ClubsSearch" )) {path1="/"}
if (location.pathname.startsWith("/AthletesSearch" )) {path1="/"}
if (location.pathname.startsWith("/profile" )) {path1="/AthletesSearch"}
if (location.pathname.startsWith("/incr" )) {path1="/competion/1"}
if (location.pathname.startsWith("/marcas" )) {path1="/competion/1"}
if (location.pathname.startsWith("/Rankings" )) {path1="/"}
if (location.pathname.startsWith("/club-profile" )) {path1="/ClubsSearch"}
if (sessionStorage.getItem("Back") ) {
  sessionStorage.removeItem("Back")
  return BackButtonImg("/")
}


   
    return BackButtonImg(path1)
  }

  function ClubOrAthetBut() {
     
    return IsClube ? (
      <Link onMouseEnter={()=>{sessionStorage.setItem("Back","1")}} to={`/club-profile/SCP`}>
          <img
            onMouseEnter={() => {
              setIsHovered2(true);
            }}
            onMouseLeave={() => {
              setIsHovered2(false);
            }}
            src={isHovered2 ? SCP_logo2 : SCP_logo}
            style={{ height: 60 ,padding:"10px"}}
            alt="Exemplo"
          />
        </Link>
    ) : (
      <Link onMouseEnter={()=>{sessionStorage.setItem("Back","1")}} to={`/profile/${encodeURIComponent("João Coelho")}`}>
          <img
            onMouseEnter={() => {
              setIsHovered2(true);
            }}
            onMouseLeave={() => {
              setIsHovered2(false);
            }}
            src={isHovered2 ? PerfilImg2 : PerfilImg}
            style={{ height: 60 ,padding:"10px"}}
            alt="Exemplo"
          />
        </Link>
    );
  }
  function LoginButton() {
    return !isLoginDone ? (
      <Link to={"/login"}>
        <Button variant="primary">Login</Button>
      </Link>
    ) : (
      <>
        {ClubOrAthetBut()}
        <Button
          variant="danger"
          onClick={() => {
            sessionStorage.removeItem("Login");
            console.log(sessionStorage.getItem("Login"));
            setLog(false);
            nave("/");
          }}
        >
          Log Out
        </Button>
      </>
    );
  }
  const [isHovered, setIsHovered] = useState(false);
  const [isHovered2, setIsHovered2] = useState(false);
  const [isHovered3, setIsHovered3] = useState(false);

  const handleMouseEnter = () => {
    setIsHovered(true);
  };

  const handleMouseLeave = () => {
    setIsHovered(false);
  };

  return (
    <Navbar expand="lg" className="bg-body-tertiary">
      <Container>
        <Link to={"/"}>
          <img
            onMouseEnter={()=>setIsHovered3(true)}
            onMouseLeave={()=>setIsHovered3(false)}
            src={isHovered3 ? Logo : Logo_noBackground}
            style={{ height: 60 }}
            alt="Exemplo"
          />
        </Link>
        {BackButton()}
        <Navbar.Toggle aria-controls="basic-navbar-nav" />
        <Navbar.Collapse id="basic-navbar-nav">
          <Nav className="ms-auto me-4">
            <Link
              to={"/competions"}
              className="nav-link"
              style={{ textDecoration: "none", color: "inherit" ,background:location.pathname.startsWith("/competions" )? "#00f0ff" : "transparent"}}
              id="nav1"
              onMouseEnter={() => { document.getElementById("nav1").style.background = location.pathname.startsWith("/competions") ? "#00f0ff" : "#aaaaaa"; }}
              onMouseLeave={() => { document.getElementById("nav1").style.background = location.pathname.startsWith("/competions") ? "#00f0ff" : "transparent"; }}
            >
              <h3 className="my-0">Competições</h3>
            </Link>
            <Link
              to={"/ClubsSearch"}
              className="nav-link"
              style={{ textDecoration: "none", color: "inherit" ,background:location.pathname.startsWith("/ClubsSearch" )? "#00f0ff" : "transparent"}}
              id="nav2"
              onMouseEnter={() => { document.getElementById("nav2").style.background = location.pathname.startsWith("/ClubsSearch") ? "#00f0ff" : "#aaaaaa"; }}
              onMouseLeave={() => { document.getElementById("nav2").style.background = location.pathname.startsWith("/ClubsSearch") ? "#00f0ff" : "transparent"; }}
            >
              <h3 className="my-0">Clubes</h3>
            </Link>
            <Link
              to={"/AthletesSearch"}
              className="nav-link"
              style={{ textDecoration: "none", color: "inherit" ,background:location.pathname.startsWith("/AthletesSearch" )? "#00f0ff" : "transparent"}}
              id="nav3"
              onMouseEnter={() => { document.getElementById("nav3").style.background = location.pathname.startsWith("/AthletesSearch") ? "#00f0ff" : "#aaaaaa"; }}
              onMouseLeave={() => { document.getElementById("nav3").style.background = location.pathname.startsWith("/AthletesSearch") ? "#00f0ff" : "transparent"; }}
            > 
              <h3 className="my-0">Perfis</h3>
            </Link>
            <Link
              to={"/Rankings"}
              className="nav-link"
              style={{ textDecoration: "none", color: "inherit" ,background:location.pathname.startsWith("/Rankings" )? "#00f0ff" : "transparent"}}
              id="nav4"
              onMouseEnter={() => { document.getElementById("nav4").style.background = location.pathname.startsWith("/Rankings") ? "#00f0ff" : "#aaaaaa"; }}
              onMouseLeave={() => { document.getElementById("nav4").style.background = location.pathname.startsWith("/Rankings") ? "#00f0ff" : "transparent"; }}
            >
              <h3 className="my-0">Rankings</h3>
            </Link>
          </Nav>
          {LoginButton()}
        </Navbar.Collapse>
      </Container>
    </Navbar>
  );
}

export default TheNavBar;
