import React, { useState, useMemo } from "react";
import { Link } from "react-router-dom";
import ReactPaginate from 'react-paginate';

import TheNavBar from "./TheNavBar";
import Footer from './Footer';
import NoResultsCard from './NoResultsCard';
import "./CommonStyles.css";

import clubData from "./ClubData";

// Function to convert date format from MM/DD/YYYY to DD/MM/YYYY
function convertDateFormat(clubs) {
  return clubs.map(club => {
    const [month, day, year] = club.dateOfCreation.split('/');
    club.dateOfCreation = `${day}/${month}/${year}`;
    return club;
  });
}

// Converting date format
const clubDataFormatted = convertDateFormat(clubData);

function resetScrollPosition() {
  window.scrollTo({
    top: 0, // Define a posição superior como 0 para rolar para o topo da página
    left: 0, // Define a posição esquerda como 0 para rolar para a esquerda da página
    behavior: 'smooth' // Adiciona um efeito de rolagem suave
  });
}


function ClubsSearch() {
  const [query, setQuery] = useState("");
  const [currentPage, setCurrentPage] = useState(0);
  const [sortConfig, setSortConfig] = useState({ key: 'sigla', direction: 'ascending' });

  const handleSort = (key) => {
    let direction = 'ascending';
    if (sortConfig.key === key && sortConfig.direction === 'ascending') {
      direction = 'descending';
    }
    setSortConfig({ key, direction });
  };

  const filteredAndSortedClubs = useMemo(() => {
    let filteredClubs = [...clubDataFormatted];

    filteredClubs = clubDataFormatted.filter(
      club => club.sigla.toLowerCase().includes(query.toLowerCase()) ||
                 club.name.toLowerCase().includes(query.toLowerCase()) ||
                 club.district.toLowerCase().includes(query.toLowerCase())
    );

    if (sortConfig.key === 'dateOfCreation') {
      filteredClubs.sort((a, b) => {
        const dateA = new Date(a.dateOfCreation.split('/').reverse().join('-'));
        const dateB = new Date(b.dateOfCreation.split('/').reverse().join('-'));
        return sortConfig.direction === 'ascending' ? dateA - dateB : dateB - dateA;
        });
      } else {
        filteredClubs.sort((a, b) => {
          if (a[sortConfig.key] < b[sortConfig.key]) {
            return sortConfig.direction === 'ascending' ? -1 : 1;
          }
          if (a[sortConfig.key] > b[sortConfig.key]) {
            return sortConfig.direction === 'ascending' ? 1 : -1;
          }
          return 0;
        });
      }
      return filteredClubs;
    }, [query, sortConfig]);

  const handlePageClick = (event) => {
    setCurrentPage(event.selected);
  };

  return (
    <>
      <TheNavBar />
      <div className="club-search">
        <header className="search-header">
          <h1 className="page-title">Procura de Clubes</h1>
          <input
            type="text"
            placeholder="Search..."
            value={query}
            onChange={(e) => {
              setCurrentPage(0);  // Reset to first page when query changes
              setQuery(e.target.value);
            }}
            className="search-bar"
          />
        </header>

        <ReactPaginate
          previousLabel={"← Previous"}
          nextLabel={"Next →"}
          pageCount={Math.ceil(filteredAndSortedClubs.length / 20)}
          onPageChange={handlePageClick}
          containerClassName={"pagination"}
          activeClassName={"active"}
          forcePage={currentPage}  // Ensures pagination stays in sync
        />

        <table className="tabletable-striped table-hover table-custom">
          <thead>
            <tr>
              <th onClick={() => handleSort('sigla')}>
                Sigla <span className="sortable">{sortConfig.key === 'sigla' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
              <th onClick={() => handleSort('name')}>
                Nome <span className="sortable">{sortConfig.key === 'name' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
              <th onClick={() => handleSort('district')}>
                Distrito <span className="sortable">{sortConfig.key === 'district' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
              <th onClick={() => handleSort('dateOfCreation')}>
                Data de Criação <span className="sortable">{sortConfig.key === 'dateOfCreation' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
            </tr>
          </thead>
          <tbody>
            {filteredAndSortedClubs.length > 0 ? (
            filteredAndSortedClubs
              .slice(currentPage * 20, (currentPage + 1) * 20)
              .map((club, index) => (
                <tr key={index}>
                <td>{club.sigla === "SCP" ? (
                  <Link to={`/club-profile/${encodeURIComponent(club.sigla)}`} onClick={resetScrollPosition} className="link">
                    {club.sigla}
                  </Link>
                ) : (
                  club.sigla
                )}</td>
                <td>{club.name}</td>
                <td>{club.district}</td>
                <td>{club.dateOfCreation}</td>
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
          pageCount={Math.ceil(filteredAndSortedClubs.length / 20)}
          onPageChange={handlePageClick}
          containerClassName={"pagination"}
          activeClassName={"active"}
          forcePage={currentPage}  // Ensures pagination stays in sync
        />
      </div>
      <Footer />
      <style jsx>{`
        body {
          background-color: #ffe9e0;
        }
      `}</style>
    </>
  );
}

export default ClubsSearch;