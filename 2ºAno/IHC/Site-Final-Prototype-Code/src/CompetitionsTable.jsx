import React, { useState, useMemo } from "react";
import { Link } from "react-router-dom";
import "./CommonStyles.css";
import ReactPaginate from 'react-paginate';


function CompetitionsTable({ competitions,query }) {
  
  const [sortConfig, setSortConfig] = useState({ key: 'dias', direction: 'ascending' });
  const [currentPage, setCurrentPage] = useState(0);
  const handlePageClick = (event) => {
    setCurrentPage(event.selected);
  };
  const handleSort = (key) => {
    let direction = 'ascending';
    if (sortConfig.key === key && sortConfig.direction === 'ascending') {
      direction = 'descending';
    }
    setSortConfig({ key, direction });
  };

  const filteredAndSortedClubs = useMemo(() => {
    let filteredClubs ;
    setCurrentPage(0);
    filteredClubs = competitions.filter(
      club => (club.nomeCompeticao.toLowerCase().includes(query[0].toLowerCase()) ||
      club.tipoProva.toLowerCase().includes(query[0].toLowerCase()))&&(query[1]===""||club.distrito===query[1])
    );

    if (sortConfig.key === 'dias') {
      filteredClubs.sort((a, b) => {
        const dateA = a.dias;
        const dateB = b.dias;
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
    }, [query, sortConfig,competitions]);


  return (<>
    <table className="tabletable-striped table-hover table-custom">
      <thead>
        <tr>
          <th onClick={() => handleSort('dias')}>
                Dias<span className="sortable">{sortConfig.key === 'dias' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
          <th onClick={() => handleSort('nomeCompeticao')}>
                Nome Competição<span className="sortable">{sortConfig.key === 'nomeCompeticao' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
          <th onClick={() => handleSort('distrito')}>
                Distrito<span className="sortable">{sortConfig.key === 'distrito' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
          <th onClick={() => handleSort('Regulamento')}>
                Regulamento<span className="sortable">{sortConfig.key === 'Regulamento' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
          {/* <th onClick={() => handleSort('tipoProva')}>
                Tipo de Prova<span className="sortable">{sortConfig.key === 'tipoProva' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th> */}
              
        </tr>
      </thead>
      <tbody>
        {filteredAndSortedClubs.slice(currentPage * 6, (currentPage + 1) * 6).map((competition, index) => (
          <tr key={index}>
            <td>{competition.dias.toLocaleDateString("pt-PT")}</td>
            <td><Link to={"/competion/1"}>{competition.nomeCompeticao}</Link></td>
            <td>{competition.distrito}</td>
            <td>{competition.regulamento}</td>
            {/* <td>{competition.tipoProva}</td> */}
           
          </tr>
        ))}
      </tbody>
    </table>
    <ReactPaginate
          previousLabel={"← Previous"}
          nextLabel={"Next →"}
          pageCount={Math.ceil(filteredAndSortedClubs.length / 6)}
          onPageChange={handlePageClick}
          containerClassName={"pagination"}
          activeClassName={"active"}
          forcePage={currentPage} // Ensures pagination stays in sync
        />
    </>
  );


}

export default CompetitionsTable;
