import React, { useState, useMemo } from "react";
import { Link } from "react-router-dom";
import ReactPaginate from 'react-paginate';
import 'bootstrap/dist/css/bootstrap.min.css'; // Include Bootstrap styles

import TheNavBar from "./TheNavBar";
import Footer from './Footer';
import NoResultsCard from './NoResultsCard';
import './CommonStyles.css';


import athleteData from "./AthleteData";

function AthletesSearch() {
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
    let filtered = [...athleteData];

     filtered = filtered.filter(
      athlete => athlete.name.toLowerCase().includes(query.toLowerCase()) ||
                 athlete.district.toLowerCase().includes(query.toLowerCase()) ||
                 athlete.club.toLowerCase().includes(query.toLowerCase())
      );

      if (sortConfig.key === 'birthDate') {
      filtered.sort((a, b) => {
        const dateA = new Date(a.birthDate.split('/').reverse().join('-'));
        const dateB = new Date(b.birthDate.split('/').reverse().join('-'));
        return sortConfig.direction === 'ascending' ? dateA - dateB : dateB - dateA;
        });
      } else {
        filtered.sort((a, b) => {
          if (a[sortConfig.key] < b[sortConfig.key]) {
            return sortConfig.direction === 'ascending' ? -1 : 1;
          }
          if (a[sortConfig.key] > b[sortConfig.key]) {
            return sortConfig.direction === 'ascending' ? 1 : -1;
          }
          return 0;
        });
      }
      return filtered;
    }, [query, sortConfig]);

  const handlePageClick = (event) => {
    setCurrentPage(event.selected);
  };

  return (
    <>
      <TheNavBar />
      <div className="athlete-search">
        <header className="search-header">
          <h1 className="page-title">Procura de atletas</h1>
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
          pageCount={Math.ceil(filteredAndSortedAthletes.length / 20)}
          onPageChange={handlePageClick}
          containerClassName={"pagination"}
          activeClassName={"active"}
          forcePage={currentPage}  // Ensures pagination stays in sync
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
              <th onClick={() => handleSort('district')}>
                Distrito <span className="sortable">{sortConfig.key === 'district' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
              <th onClick={() => handleSort('birthDate')}>
                Data de nascimento <span className="sortable">{sortConfig.key === 'birthDate' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
              <th onClick={() => handleSort('club')}>
                Clube <span className="sortable">{sortConfig.key === 'club' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
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
                  <td>{athlete.district}</td>
                  <td>{athlete.birthDate}</td>
                  <td>
                    {athlete.club === "SCP SPORTING C P" ? (
                      <Link
                        to={`/club-profile/${encodeURIComponent(athlete.club)}`}
                        className="link"
                      >
                        {athlete.club}
                      </Link>
                    ) : (
                      athlete.club
                    )}
                  </td>
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
          pageCount={Math.ceil(filteredAndSortedAthletes.length / 20)}
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

export default AthletesSearch;