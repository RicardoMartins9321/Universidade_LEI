import React, { useState } from "react";
import { Link } from "react-router-dom";


import TheNavBar from "./TheNavBar";
import Footer from './Footer';
import AthletesLatestMarks from "./TableLatestMarks";
import ProfileTable from "./TableDefault";
import TableProgression from "./TableProgression";
import TableSeasonBest from "./TableSeasonBest";
import GraphProgression from "./GraphProgression";

/*Import images*/
import Joao_Coelho from "./imagens/Joao_Coelho.png";
import pista from "./imagens/pista.png";

const ProfileInfo = () => {
  return (
    <section className="profile-info">
      <img src={Joao_Coelho} alt="Profile" className="profile-image" />
      <img src={pista} alt="Background" className="background-image" />
      <div className="profile-details">
        <h1 className="profile-name">João Coelho</h1>
        <div className="profile-data">
          <div className="profile-data-labels">
            <p><b>Distrito:</b></p>
            <p><b>Nasceu:</b></p>
            <p><b>Género:</b></p>
            <p><b>Clube:</b></p>
            <p><b>Disciplinas:</b></p>
          </div>
          <div className="profile-data-values">
            <p>Aveiro</p>
            <p>04/04/1999</p>
            <p>Masculino</p>
            <p>
              <Link to="/club-profile/SCP" className="link" style={{ color: "green", textDecoration: "none" }}>
                <b>SCP</b>
              </Link>
            </p>
            <p>400m, 4x400m, 200m</p>
          </div>
        </div>
      </div>
    </section>
  );
};

const ProfileTabs = ({ setActiveTab, activeTab }) => {
  return (
    <div className="profile-tabs">
      <button
        onClick={() => setActiveTab('records')}
        className={`tab-button ${activeTab === 'records' ? 'active' : ''}`}
      >
        Recordes Pessoais
      </button>
      <button
        onClick={() => setActiveTab('season')}
        className={`tab-button ${activeTab === 'season' ? 'active' : ''}`}
      >
        Temporada
      </button>
      <button
        onClick={() => setActiveTab('progress')}
        className={`tab-button ${activeTab === 'progress' ? 'active' : ''}`}
      >
        Progressão
      </button>
      <button
        onClick={() => setActiveTab('latest')}
        className={`tab-button ${activeTab === 'latest' ? 'active' : ''}`}
      >
        Últimos Resultados
      </button>
    </div>
  );
};

const ProfileContent = () => {
  const [activeTab, setActiveTab] = useState('records'); // default tab

  return (
    <>
      <ProfileTabs setActiveTab={setActiveTab} activeTab={activeTab}/>
      {activeTab === 'records' && <ProfileTable />}
      {activeTab === 'latest' && <AthletesLatestMarks />}
      {activeTab === 'progress' && (
      <>
        <TableProgression />
        <GraphProgression />
      </>
      )}
      {activeTab === 'season' && <TableSeasonBest />}
    </>
  );
};


function AthleteProfile() {

  return (
    <>
      <TheNavBar />
      <main>
        <ProfileInfo />
        <ProfileContent />
      </main>
      <Footer />

      <style jsx>{`
        body {
          background-color: #ffe9e0;
        }

        .profile-info {
          position: relative;
          display: flex;
          gap: 20px;
          padding: 22px 80px 22px 14px;
          min-height: 361px;
          text-align: center;
          overflow: hidden;
          background-color: #f7f7f7; /* Light grey background for contrast */
          border-radius: 8px; /* Rounded corners for a smoother look */
          box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Subtle shadow for depth */
          margin: 40px auto; /* Centering the box with vertical spacing */
          width: 90%; /* Limiting max width for better layout control */
          max-width: 1000px; /* Limiting max width for better layout control */
        }

        @media (max-width: 700px) {
          .profile-info {
            flex-wrap: wrap;
            padding-right: 20px;
            margin-top: 40px;
            justify-content: center; // Center the items
          }

          .profile-image {
            width: 150px; // Adjust image size
            margin: 0 auto; // Center the image
          }
        }

        .background-image {
          position: absolute;
          inset: 0;
          width: 100%;
          height: 100%;
          object-fit: cover;
          object-position: center;
          z-index: 0;
        }

        .profile-image {
          width: 250px;
          object-fit: cover;
          object-position: center;
          margin-top: 7px;
          z-index: 1;
          border-radius: 12px;
        }

        @media (min-width: 1200px) {
          .profile-image {
            width: 300px; /* Maximum size for large desktops */
          }
        }

        .profile-details {
          position: relative;
          display: flex;
          flex-direction: column;
          gap: 20px;
          padding-left: 20px;
        }

        .profile-name {
          font-size: 56px;
          font-family: Inter, sans-serif;
          color: #000;
          margin-top: 10px; /* Align top of text with image */
        }

        .profile-data {
          display: flex;
          gap: 20px;
          margin-top: 29px;
          font-size: 22px;
          color: #040404;
        }

        @media (min-width: 1000px) {
          .profile-name {
            font-size: 56px;
          }
          .profile-data {
            font-size: 32px;
          }
        }

        .profile-data-labels, .profile-data-values {
          display: flex;
          flex-direction: column;
          align-items: center;
        }

        .tab-button {
          padding: 10px 20px;
          border-radius: 5px;
          background-color: #f0f0f0;
          transition: background-color 0.3s, color 0.3s;
          cursor: pointer;
          border: 1px solid #ccc;
        }

        .tab-button:hover {
          background-color: #e0e0e0;
        }

        .tab-button.active {
          background-color: #007bff;
          color: white;
        }

        .profile-tabs {
          display: flex;
          justify-content: center;
          flex-wrap: wrap;
          gap: 10px;
          margin-top: 20px;
          margin-bottom: 20px;
          font-family: Inter, sans-serif;
        }

        /* Increase the size of the buttons on larger screens */
        @media (min-width: 900px) {
          .tab-button {
            padding: 15px 30px; /* Larger padding for bigger buttons */
            font-size: 1.2rem; /* Larger font size for better readability */
            margin: 5px; /* Adding more spacing between buttons */
          }

          .profile-tabs {
            gap: 20px; /* Increased gap between buttons */
          }
        }

        @media (min-width: 1500px) {
          .tab-button {
            padding: 15px 30px; /* Larger padding for bigger buttons */
            font-size: 1.8rem; /* Larger font size for better readability */
            margin: 5px; /* Adding more spacing between buttons */
          }

          .profile-tabs {
            gap: 20px; /* Increased gap between buttons */
          }
        }

        .table {
            border-radius: 8px; /* Rounded corners for tabs */
            box-shadow: 0 2px 4px rgba(0,0,0,0.1); /* Consistent shadow as profile */
            margin: 20px auto; /* Centering the box with vertical spacing */
            margin-top: 40px; /* Add extra space to separate the table from tabs */
            max-width: 90%; /* Limiting max width for better layout control */
        }

          .table th, .table td {
            padding: 12px; /* Add padding to cells for spacing */
            text-align: center; /* Center-align text inside cells */
            border: 1px solid #ddd; /* Add borders to cells for separation */
          }

          .table th {
            background-color: #f2f2f2; /* Light grey background for table header */
          }

          /* Apply uniform styles to all tables */
          .table thead th,


          /* Apply specific styles to header cells */
          .table thead th {
            font-weight: bold; /* Emphasize header text */
          }

          /* Apply specific styles to body cells */
          .table tbody td {
            font-family: Inter, sans-serif; /* Set font family for cell text */
          }

          /* Apply specific styles to alternate rows for better readability */
          .table tbody tr:nth-child(even) {
            background-color: #f9f9f9; /* Light grey background for alternate rows */
          }

      `}</style>
    </>
  );
}

export default AthleteProfile;

