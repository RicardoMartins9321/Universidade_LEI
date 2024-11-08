import React, { useState, useMemo } from "react";
import { Link } from "react-router-dom";
import ReactPaginate from 'react-paginate';

import TheNavBar from "./TheNavBar";
import Footer from './Footer';
import NoResultsCard from './NoResultsCard';
import "./CommonStyles.css";

import SCPAthletes from "./SCPAthletesData";
import { Button } from "react-bootstrap";

const EchelonOrder = ["Veteranos", "Senior", "Sub-22", "Sub-20", "Sub-18", "Sub-16", "Sub-14", "Sub-12", "Sub-10"];

function sortByEchelon(a, b) {
  return EchelonOrder.indexOf(a.echelon) - EchelonOrder.indexOf(b.echelon);
}

function ClubProfile() {
  const [query, setQuery] = useState("");
  const [currentPage, setCurrentPage] = useState(0);
  const [sortConfig, setSortConfig] = useState({ key: 'name', direction: 'ascending' });
  const [selectedAthletes, setSelectedAthletes] = useState([]);
  const [selectedAthletes2, setSelectedAthletes2] = useState([  {name: 'Bruno Fernandes', gender: 'Masculino', echelon: 'Sub-18', birthDate: '23/03/2003', nationality: 'POR',selected:true}, 
  {name: 'Cláudia Almeida', gender: 'Feminino', echelon: 'Sub-18', birthDate: '29/08/2002', nationality: 'GUI',selected:true}, 
  {name: 'Mariana Silva', gender: 'Femenino', echelon: 'Sub-18', birthDate: '17/08/1997', nationality: 'UCK',selected:true}, 
  {name: 'Mariana Santos', gender: 'Femenino', echelon: 'Sub-18', birthDate: '08/04/2000', nationality: 'POR',selected:true}, 
  {name: 'Leandro Gonçalves', gender: 'Masculino', echelon: 'Sub-18', birthDate: '24/07/2001', nationality: 'ESP',selected:true}, 
  {name: 'João Pedro', gender: 'Masculino', echelon: 'Sub-18', birthDate: '11/03/2004', nationality: 'POR',selected:true}]);
  
  const handleSort = (key) => {
    let direction = 'ascending';
    if (sortConfig.key === key && sortConfig.direction === 'ascending') {
      direction = 'descending';
    }
    setSortConfig({ key, direction });
  };

  const handleSelectAthlete = (athlete) => {
    const isSelected = selectedAthletes.some(selected => selected.name === athlete.name);
    if (isSelected) {
      const updatedSelected = selectedAthletes.filter(selected => selected.name !== athlete.name);
      setSelectedAthletes(updatedSelected);
    } else {
      setSelectedAthletes([...selectedAthletes, athlete]);
    }
    console.log(selectedAthletes);
  };
  

  const filteredAndSortedAthletes = useMemo(() => {
    let filtered = SCPAthletes.map(athlete => ({
      ...athlete,
      selected: false
    }));
    

    filtered = filtered.filter(
      athlete => (athlete.name.toLowerCase().includes(query.toLowerCase()) ||
        athlete.echelon.toLowerCase().includes(query.toLowerCase())) && (athlete.echelon === EchelonOrder[1] || athlete.echelon === EchelonOrder[2])
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
    return filtered.map(athlete => ({
      ...athlete,
      selected: selectedAthletes.some(selected => selected.name === athlete.name)
    }));
  }, [query, sortConfig, selectedAthletes]);

  const handlePageClick = (event) => {
    setCurrentPage(event.selected);
  };

  const itemsPerPage = 20;

  return (
    <>
      <TheNavBar />
      <div className="athlete-search">
        <header className="search-header">
          <h1 className="page-title">Inscrições Prova 200 metros</h1>
          <h3>Juniores</h3>
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
              <th>
                Selecionar
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
                    <td>{"Sub-18"}</td>
                    <td>{athlete.birthDate}</td>
                    <td>{athlete.nationality}</td>
                    <td onClick={()=>{athlete.selected=!athlete.selected;handleSelectAthlete(athlete);}}>
                      <input
                        type="checkbox"
                        disabled={selectedAthletes2.some((at)=>at.name===athlete.name)}
                        checked={athlete.selected||selectedAthletes2.some((at)=>at.name===athlete.name)}
                        onChange={() => handleSelectAthlete(athlete)}
                      />
                    </td>
                  </tr>
                ))
            ) : NoResultsCard({
              title: "No Results Found",
              message: "Não encontramos nenhum resultado correspondente para a sua pesquisa. Tente usar palavras-chave diferentes ou navegue pelas categorias.",
              buttonText: "Clear search",
              onClick: () => setQuery("")
            }
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
      <Button onClick={()=>{
        if(selectedAthletes.length!=0){
        alert("Incrições enviadas")

        setSelectedAthletes2([...selectedAthletes2,...selectedAthletes])
        }
      }} variant="primary">Inscrever</Button>
      </div>
      <Footer />
    </>
  );
}

export default ClubProfile;
