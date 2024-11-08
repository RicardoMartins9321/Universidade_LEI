import React, { useState, useMemo } from "react";
import TheNavBar from "./TheNavBar";
import Footer from "./Footer";
import Calendar from "react-calendar";
import "react-calendar/dist/Calendar.css";
import "./Competions.css"; // Importe seu arquivo CSS personalizado
import CompetitionsTable from "./CompetitionsTable";
import { Container, Form, Button, Card } from "react-bootstrap";
import { useNavigate } from "react-router-dom";
//import NoResultsCard from './NoResultsCard';
import "./CommonStyles.css";
import compData from "./CompData";
import "bootstrap/dist/css/bootstrap.min.css";
import '@fortawesome/fontawesome-free/css/all.min.css';

function Competions() {
  const navegate = useNavigate();

  const [selectedDate, setSelectedDate] = useState(0);
  const [query, setQuery] = useState(["",""]);
  const competitionsData = [...compData];

  const [competitions, setCompetitions] = useState([...competitionsData]);
  const [red, setRed] = useState(false);

  var list = [];
  competitions.forEach((el) => {
    list.push(el.dias);
  });

  const handleDayClick = (value) => {
    setSelectedDate(value);
    if (
      list.find(
        (item) =>
          item.getDate() === value.getDate() &&
          item.getMonth() === value.getMonth() &&
          item.getFullYear() === value.getFullYear()
      )
    ) {
      //navegate("/competion/1");
      setCompetitions([
        ...competitionsData.filter(
          (item) =>
            item.dias.getDate() === value.getDate() &&
            item.dias.getMonth() === value.getMonth() &&
            item.dias.getFullYear() === value.getFullYear()
        ),
      ]);
      setRed(true);
    } else {
      setCompetitions([...competitionsData]);
      setRed(false);
    }
  };

  const removeDigitOfCompetionsDay = ({ date, view }) => {
    // Verifica se estamos na visualização do mês e se o dia e o mês estão na lista
    if (view === "month") {
      // Verifica se a data atual está na lista de datas destacadas
      if (
        list.find(
          (item) =>
            item.getDate() === date.getDate() &&
            item.getMonth() === date.getMonth() &&
            item.getFullYear() === date.getFullYear()
        )
      ) {
        return red ? "custom-tile-red" : "custom-tile"; // Retorna a classe de estilo correspondente
      } else {
        return "";
      }
    }
  };

  const filtrar = () => {
    const district = document.getElementById("district");
    const name = document.getElementById("nameC");
    setQuery([name.value,district.value]);
  };

  return (
    <>
      <TheNavBar />
      <div className="athlete-search">
        <header className="search-header">
          <h1 className="page-title">Procura de Competições</h1>

          <div className="d-flex">
            <div className="calendar-container">
              <Calendar
                tileClassName={removeDigitOfCompetionsDay}
                onClickDay={handleDayClick}
                value={selectedDate}
                calendarClassName="custom-calendar"
                formatShortWeekday={(locale, date) =>
                  ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab"][
                    date.getDay()
                  ]
                }
              />
            </div>

            <Card style={{ width: "18rem", marginLeft: "20px" }}>
              <Card.Body>
                <Card.Title>Filter</Card.Title>
                <Form>
                  <Form.Group className="mb-3">
                    <Form.Label>Nome da Competição</Form.Label>
                    <Form.Control type="text" id="nameC" required />
                  </Form.Group>
                  <Form.Group>
                    <Form.Label>Distrito</Form.Label>
                    <Form.Control
                      id="district"
                      onChange={filtrar}
                      as="select"
                      required
                    >
                      <option selected value="">
                        Selecione o distrito
                      </option>
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
                    </Form.Control>
                  </Form.Group>
                  <Button onClick={filtrar} variant="primary" type="button">
                    Filter
                  </Button>
                </Form>
              </Card.Body>
            </Card>
          </div>
          <Container className="col-9" style={{ marginTop: "25px" }}>
            <CompetitionsTable competitions={competitions} query={query} />
          </Container>
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
