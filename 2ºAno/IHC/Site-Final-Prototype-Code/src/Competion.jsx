import React, { useState, useMemo } from "react";
import TheNavBar from "./TheNavBar";
import Footer from "./Footer";
import {
  Button,
  Container,
  Pagination,
} from "react-bootstrap";
import { useParams, useNavigate,Link } from "react-router-dom";
import "./CommonStyles.css";
import ReactPaginate from 'react-paginate';
function Competions() {
  const { id } = useParams();
  const navegate = useNavigate();
  const [currentPage, setCurrentPage] = useState(0);
  const handlePageClick = (event) => {
    setCurrentPage(event.selected);
  };
  const loginData = JSON.parse(sessionStorage.getItem("Login"));

  const inscrever = () => {
    if (loginData && loginData["IsClube"]) {
      return <td><Link to={"/incricoes/SCP"}>Inscrever</Link></td>;
    }
    return null;
  };

  const inscrever2 = () => {
    if (loginData && loginData["IsClube"]) {
      return <th>Inscrições</th>;
    }
    return null;
  };

  const sortByHour = (a, b) => {
    const timeA = a.hora.getHours() * 60 + a.hora.getMinutes();
    const timeB = b.hora.getHours() * 60 + b.hora.getMinutes();
    return timeA - timeB;
  };
  const sortByGender = (a, b) => {
    return a.genero.localeCompare(b.genero);
  };
  const sortByProva = (a, b) => {
    return a.prova.localeCompare(b.prova);
  };

  const testBool = (bool) => (bool ? <h1>filiacao</h1> : <>filiacao</>);
  const showDate = (hora) => {
    const hours = hora.getHours();
    const minutes = hora.getMinutes();

    // Formata a hora no formato HH:MM
    return `${hours < 10 ? "0" : ""}${hours}:${
      minutes < 10 ? "0" : ""
    }${minutes}`;
  };

  const provas = [
    {
      hora: new Date(0, 0, 0, 10, 0),
      genero: "Masculino",
      prova: "Corrida 200m",
      escaloes: "Juniores",
      filiacao: true,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 11, 30),
      genero: "Feminino",
      prova: "Salto em Altura",
      escaloes: "Juniores",
      filiacao: false,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 13, 0),
      genero: "Masculino",
      prova: "Lançamento de Peso",
      escaloes: "Seniores",
      filiacao: true,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 14, 30),
      genero: "Feminino",
      prova: "Salto em Comprimento",
      escaloes: "Juniores",
      filiacao: false,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 16, 0),
      genero: "Masculino",
      prova: "Salto com Vara",
      escaloes: "Seniores",
      filiacao: true,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 10, 0),
      genero: "Feminino",
      prova: "Corrida 200m",
      escaloes: "Juniores",
      filiacao: false,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 11, 30),
      genero: "Masculino",
      prova: "Salto em Altura",
      escaloes: "Seniores",
      filiacao: true,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 13, 0),
      genero: "Feminino",
      prova: "Lançamento de Disco",
      escaloes: "Juniores",
      filiacao: false,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 14, 30),
      genero: "Masculino",
      prova: "Corrida 400m",
      escaloes: "Seniores",
      filiacao: true,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 16, 0),
      genero: "Feminino",
      prova: "Salto em Altura",
      escaloes: "Juniores",
      filiacao: false,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 10, 0),
      genero: "Masculino",
      prova: "Lançamento de Dardo",
      escaloes: "Seniores",
      filiacao: true,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 11, 30),
      genero: "Feminino",
      prova: "Corrida 800m",
      escaloes: "Juniores",
      filiacao: false,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 13, 0),
      genero: "Masculino",
      prova: "Salto em Triplo",
      escaloes: "Seniores",
      filiacao: true,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 14, 30),
      genero: "Feminino",
      prova: "Lançamento de Peso",
      escaloes: "Juniores",
      filiacao: false,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 16, 0),
      genero: "Masculino",
      prova: "Salto em Comprimento",
      escaloes: "Seniores",
      filiacao: true,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 10, 0),
      genero: "Feminino",
      prova: "Lançamento de Disco",
      escaloes: "Juniores",
      filiacao: false,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 11, 30),
      genero: "Masculino",
      prova: "Corrida 1500m",
      escaloes: "Seniores",
      filiacao: true,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 13, 0),
      genero: "Feminino",
      prova: "Salto com Vara",
      escaloes: "Juniores",
      filiacao: false,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 14, 30),
      genero: "Masculino",
      prova: "Corrida 5000m",
      escaloes: "Seniores",
      filiacao: true,
      incricoes: "Individual",
    },
    {
      hora: new Date(0, 0, 0, 16, 0),
      genero: "Feminino",
      prova: "Lançamento de Martelo",
      escaloes: "Juniores",
      filiacao: false,
      incricoes: "Individual",
    },
  ];



  
  const [sortConfig, setSortConfig] = useState({ key: 'hora', direction: 'ascending' });

  const handleSort = (key) => {
    let direction = 'ascending';
    if (sortConfig.key === key && sortConfig.direction === 'ascending') {
      direction = 'descending';
    }
    setSortConfig({ key, direction });
  };

  const filteredAndSortedClubs = useMemo(() => {
    let filteredClubs =[...provas];


    if (sortConfig.key === 'hora') {
      filteredClubs.sort((a, b) => {
        const dateA = a.hora;
        const dateB = b.hora;
        return sortConfig.direction === 'ascending' ? dateA - dateB : dateB - dateA;
        });
      } else {
        filteredClubs.sort((a, b) => (sortConfig.direction === 'ascending' ? a[sortConfig.key].localeCompare(b[sortConfig.key]):-1*(a[sortConfig.key].localeCompare(b[sortConfig.key]))));
      }
      return filteredClubs;
    }, [ sortConfig]);


  // Para atualizar a lista mostrada, você pode simplesmente redefinir o estado com a nova lista.
  // Supondo que você está usando o estado no React para armazenar as competições, você pode fazer algo assim:

  return (
    <>
      <TheNavBar />
      <div className="athlete-search">
        <header className="search-header">
          <h1 className="page-title">Campeonatos nacionais 2020</h1>
      <Container className="col-9" style={{ marginTop: "25px" }}>
        <table className="tabletable-striped table-hover table-custom">
          <thead>
            <tr>
            <th onClick={() => handleSort('hora')}>
                Hora<span className="sortable">{sortConfig.key === 'hora' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
            <th onClick={() => handleSort('genero')}>
                Género<span className="sortable">{sortConfig.key === 'genero' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
            <th onClick={() => handleSort('prova')}>
                Prova<span className="sortable">{sortConfig.key === 'prova' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
            <th onClick={() => handleSort('escaloes')}>
                Escalões<span className="sortable">{sortConfig.key === 'escaloes' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}</span>
              </th>
              <th>Inscritos</th>
              <th>Marcas</th>
              
              
              {inscrever2()}
            </tr>
          </thead>
          <tbody>
            {filteredAndSortedClubs.slice(currentPage * 5, (currentPage + 1) * 5).map((competition, index) => (
              <tr key={index}>
                <td>{showDate(competition.hora)}</td>
                <td>{competition.genero}</td>
                <td>{competition.prova}</td>
                <td>{competition.escaloes}</td>
                <td>{<Link to={"/incritos/1"}>incritos</Link>}</td>
                <td>{<Link to={"/marcas/1"}>Marca</Link>}</td>
                {inscrever()}
              </tr>
            ))}
          </tbody>
        </table>
      </Container>


      <ReactPaginate
          previousLabel={"← Previous"}
          nextLabel={"Next →"}
          pageCount={Math.ceil(filteredAndSortedClubs.length / 5)}
          onPageChange={handlePageClick}
          containerClassName={"pagination"}
          activeClassName={"active"}
          forcePage={currentPage}  // Ensures pagination stays in sync
        />

      </header>
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

export default Competions;
