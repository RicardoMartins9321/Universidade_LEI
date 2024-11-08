import React, { useState, useMemo } from "react";
import { Link } from "react-router-dom";
import ReactPaginate from 'react-paginate';

import TheNavBar from "./TheNavBar";
import Footer from './Footer';
import NoResultsCard from './NoResultsCard';
import "./CommonStyles.css";

/*Import images*/
import SCP_logo from "./imagens/SCP_Logo.png";
import pista from "./imagens/pista.png";

import SCPAthletes from "./SCPAthletesData";

const EchelonOrder = ["Veteranos", "Senior", "Sub-23", "Sub-20", "Sub-18", "Sub-16", "Sub-14", "Sub-12", "Sub-10"];

function sortByEchelon(a, b) {
  return EchelonOrder.indexOf(a.echelon) - EchelonOrder.indexOf(b.echelon);
}

const ProfileInfo = () => {
  return (
    <section className="profile-info">
      <img src={SCP_logo} alt="Profile" className="profile-image" />
      <img src={pista} alt="Background" className="background-image" />
      <div className="profile-details">
        <h1 className="profile-name">Sporting Clube Portugal</h1>
        <div className="profile-data">
          <div className="profile-data-labels">
            <p><b>Sigla:</b></p>
            <p><b>Associação:</b></p>
            <p><b>Data de Criação:</b></p>
          </div>
          <div className="profile-data-values">
            <p>SCP</p>
            <p>Lisboa</p>
            <p>01/07/1906</p>
          </div>
        </div>
      </div>
    </section>
  );
};


function CLubProfile() {
  const [query, setQuery] = useState("");
  const [currentPage, setCurrentPage] = useState(0);
  const [sortConfig, setSortConfig] = useState({ key: 'name', direction: 'ascending' });

  const handleSort = (key) => {
    let direction = 'ascending';
    if (sortConfig.key === key && sortConfig.direction === 'ascending') {
      direction = 'descending';
    }
    setSortConfig({ key, direction });
  };

  const filteredAndSortedAthletes  = useMemo(() => {
    let filtered = [...SCPAthletes];

     filtered = filtered.filter(
      athlete => athlete.name.toLowerCase().includes(query.toLowerCase()) ||
                 athlete.echelon.toLowerCase().includes(query.toLowerCase())
      );

      filtered.sort((a, b) => {
        if (sortConfig.key === 'birthDate') {
          const dateA = new Date(a.birthDate.split('/').reverse().join('-'));
          const dateB = new Date(b.birthDate.split('/').reverse().join('-'));
          return sortConfig.direction === 'ascending' ? dateA - dateB : dateB - dateA;
        } else if (sortConfig.key === 'echelon') {
          return sortConfig.direction === 'ascending' ? sortByEchelon(a, b) : sortByEchelon(b, a);
        } else {
          if (a[sortConfig.key] < b[sortConfig.key]) return sortConfig.direction === 'ascending' ? -1 : 1;
          if (a[sortConfig.key] > b[sortConfig.key]) return sortConfig.direction === 'ascending' ? 1 : -1;
          return 0;
        }
      });
      return filtered;
    }, [query, sortConfig]);

  const handlePageClick = (event) => {
    setCurrentPage(event.selected);
  };

  const itemsPerPage = 20;

  return (
    <>
      <TheNavBar />
      <ProfileInfo />
      <div className="athlete-search">
        <header className="search-header">
          <h1 className="page-title">Procura de atletas</h1>
          <input
            type="text"
            placeholder="Search..."
            value={query}
            onChange={(e) => {
              setCurrentPage(0); // Reset to first page when query changes
              setQuery(e.target.value);
            }}
            className="search-bar"
          />
        </header>

        <ReactPaginate
          previousLabel={"← Previous"}
          nextLabel={"Next →"}
          pageCount={Math.ceil(filteredAndSortedAthletes.length / itemsPerPage)}
          onPageChange={handlePageClick}
          containerClassName={"pagination"}
          activeClassName={"active"}
          forcePage={currentPage} // Ensures pagination stays in sync
        />

        <table className="tabletable-striped table-hover table-custom">
          <thead>
            <tr>
              <th onClick={() => handleSort('name')}>
                Nome <span className="sortable">{sortConfig.key === 'name' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
              <th onClick={() => handleSort('gender')}>
                Gênero <span className="sortable">{sortConfig.key === 'gender' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
              <th onClick={() => handleSort('echelon')}>
                Escalão <span className="sortable">{sortConfig.key === 'echelon' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
              <th onClick={() => handleSort('birthDate')}>
                Data de nascimento <span className="sortable">{sortConfig.key === 'birthDate' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
              <th onClick={() => handleSort('nationality')}>
                Nacionalidade <span className="sortable">{sortConfig.key === 'nationality' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
            </tr>
          </thead>
          <tbody>
            {filteredAndSortedAthletes.length > 0 ? (
              filteredAndSortedAthletes
                .slice(currentPage * 20, (currentPage + 1) * 20)
                .map((athlete, index) => (
                  <tr key={index}>
                    <td>
                      {athlete.name === "João Coelho" ? (
                        <Link
                          to={`/profile/${encodeURIComponent(athlete.name)}`}
                          className="link"
                        >
                          {athlete.name}
                        </Link>
                      ) : (
                        athlete.name
                      )}
                    </td>
                    <td>{athlete.gender}</td>
                    <td>{athlete.echelon}</td>
                    <td>{athlete.birthDate}</td>
                    <td>{athlete.nationality}</td>
                  </tr>
                ))
            ) : NoResultsCard({
              title:"No Results Found",
              message:"Não encontramos nenhum resultado correspondente para a sua pesquisa. Tente usar palavras-chave diferentes ou navegue pelas categorias.",
              buttonText:"Clear search",
              onClick: () => setQuery("") } // Replace with actual functionality
          )}
          </tbody>
        </table>
        <ReactPaginate
          previousLabel={"← Previous"}
          nextLabel={"Next →"}
          pageCount={Math.ceil(filteredAndSortedAthletes.length / itemsPerPage)}
          onPageChange={handlePageClick}
          containerClassName={"pagination"}
          activeClassName={"active"}
          forcePage={currentPage} // Ensures pagination stays in sync
        />
      </div>
      <Footer />

      <style jsx>{`
        body {
          background-color: #ffe9e0;
          display: block;
        }

        .profile-info {
          position: relative;
          display: flex;
          align-items: center; /* Center the items horizontally */
          gap: 20px;
          padding: 22px 80px 22px 14px;
          min-height: 361px;
          text-align: center;
          overflow: hidden;
          background-color: #f7f7f7; /* Light grey background for contrast */
          border-radius: 12px; /* Rounded corners for a smoother look */
          box-shadow: 0 4px 8px rgba(0,0,0,0.1); /* Subtle shadow for depth */
          margin: 40px auto; /* Centering the box with vertical spacing */
          margin-bottom: 0; /* Remove bottom margin for better layout */
          max-width: 90%; /* Limiting max width for better layout control */
        }

        @media (max-width: 700px) {
          .profile-info {
            flex-wrap: wrap;
            padding-right: 20px;
            margin-top: 40px;
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
          width: 240px;
          height: auto; /* Maintain aspect ratio */
          object-fit: cover;
          object-position: center;
          margin-top: 7px;
          z-index: 1;
          align-items: center; /* Center the items horizontally */

        }

        .profile-details {
          position: relative;
          display: flex;
          flex-direction: column;
          gap: 20px;
          padding-left: 20px;
        }

        .profile-name {
          font-size: 40px;
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

        @media (max-width: 700px) {
          .profile-info {
            flex-wrap: wrap;
            padding-right: 20px;
            margin-top: 40px;
            justify-content: center; // Add this line to center the items
          }

          .profile-image {
            width: 150px; // Adjust image size
            margin: 0 auto; // Add this line to center the image
          }

        .profile-data-labels, .profile-data-values {
            display: flex;
            flex-direction: column;
            align-items: center;
          }

      `}</style>
    </>
  );
}

export default CLubProfile;

