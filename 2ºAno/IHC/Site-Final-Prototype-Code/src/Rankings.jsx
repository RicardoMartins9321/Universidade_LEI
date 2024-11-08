import React, {useState} from "react";
import TheNavBar from "./TheNavBar";
import Footer from "./Footer";

const initialData = [
  {
    rank: 1,
    mark: "6.52",
    name: "Carlos Santos",
    category: "Senior",
    club: "FC Porto",
    class: "60m",
    location: "Porto",
    wind: "+1.5",
    date: "2024-06-15",
  },
  {
    rank: 2,
    mark: "6.62",
    name: "André Silva",
    category: "Junior",
    club: "FC Porto",
    class: "60m",
    location: "Porto",
    wind: "+0.8",
    date: "2024-05-10",
  },
  {
    rank: 3,
    mark: "6.72",
    name: "João Silva",
    category: "U23",
    club: "Sporting CP",
    class: "100m",
    location: "Pombal",
    wind: "-",
    date: "2024-02-17",
  },
  {
    rank: 4,
    mark: "6.79",
    name: "Ricardo Santos",
    category: "Senior",
    club: "Vitória de Setúbal",
    class: "200m",
    location: "Braga",
    wind: "+1.0",
    date: "2024-01-15",
  },
  {
    rank: 5,
    mark: "6.89",
    name: "António Cruz",
    category: "Master",
    club: "Belenenses",
    class: "100m",
    location: "Pombal",
    wind: "-",
    date: "2024-02-17",
  },
  {
    rank: 6,
    mark: "6.89",
    name: "Mario Antunes",
    category: "U23",
    club: "Benfica",
    class: "200m",
    location: "Braga",
    wind: "-",
    date: "2024-01-12",
  },
  {
    rank: 7,
    mark: "6.92",
    name: "Rui Silva",
    category: "Junior",
    club: "Portimonense",
    class: "100m",
    location: "Pombal",
    wind: "-",
    date: "2024-02-17",
  },
  {
    rank: 8,
    mark: "6.95",
    name: "João Santos",
    category: "Senior",
    club: "Braga",
    class: "400m",
    location: "Braga",
    wind: "+1.0",
    date: "2024-01-15",
  },
  {
    rank: 9,
    mark: "6.99",
    name: "José Silva",
    category: "Junior",
    club: "Marítimo",
    class: "100m",
    location: "Pombal",
    wind: "-",
    date: "2024-02-17",
  },
  {
    rank: 10,
    mark: "7.02",
    name: "António Santos",
    category: "Senior",
    club: "Boavista",
    class: "200m",
    location: "Braga",
    wind: "+1.0",
    date: "2024-01-15",
  },
{
    rank: 11,
    mark: "7.05",
    name: "Manuel Silva",
    category: "Junior",
    club: "SCP",
    class: "100m Dash",
    location: "Pombal",
    wind: "-",
    date: "2024-02-17",
},
{
    rank: 12,
    mark: "7.09",
    name: "Mário Santos",
    category: "SEN",
    club: "SLB",
    class: "100m Dash",
    location: "Braga",
    wind: "+1.0",
    date: "2024-01-15",
},
{
    rank: 13,
    mark: "7.12",
    name: "Rui Silva",
    category: "Junior",
    club: "SCP",
    class: "100m Dash",
    location: "Pombal",
    wind: "-",
    date: "2024-02-13",
},
{
    rank: 14,
    mark: "6.78",
    name: "Francisco Lima",
    category: "Junior",
    club: "Sporting CP",
    class: "100m Dash",
    location: "Coimbra",
    wind: "+0.9",
    date: "2024-07-22",
},
{
    rank: 15,
    mark: "6.89",
    name: "Sara Moreira",
    category: "Sub-23",
    club: "FC Porto",
    class: "60m Dash",
    location: "Porto",
    wind: "+1.1",
    date: "2024-08-05",
},
{
    rank: 16,
    mark: "6.82",
    name: "Pedro Nunes",
    category: "Senior",
    club: "SLB",
    class: "100m Dash",
    location: "Faro",
    wind: "+0.4",
    date: "2024-08-25",
},
{
  rank: 17,
  mark: "6.77",
  name: "Cláudia Neto",
  category: "Senior",
  club: "SCP",
  class: "100m Dash",
  location: "Setúbal",
  wind: "+0.3",
  date: "2024-09-01",
},
{
  rank: 18,
  mark: "6.95",
  name: "Daniel Rocha",
  category: "Junior",
  club: "FC Porto",
  class: "60m Dash",
  location: "Braga",
  wind: "-",
  date: "2023-09-10",
},
{
  rank: 19,
  mark: "6.83",
  name: "Elena Sampaio",
  category: "Sub-23",
  club: "Benfica",
  class: "100m Dash",
  location: "Lisbon",
  wind: "+1.2",
  date: "2024-09-20",
},
{
  rank: 20,
  mark: "6.91",
  name: "Gabriel Alves",
  category: "Senior",
  club: "Sporting CP",
  class: "60m Dash",
  location: "Coimbra",
  wind: "+0.6",
  date: "2022-10-05",
}
];


const TableRankings = ({ filteredData, handleSort, sortConfig }) => (
  <table className="tabletable-striped table-hover table-custom">
    <thead>
      <tr>
        <th onClick={() => handleSort('rank')}>
          Rank 
          <span className="sortable">
            {sortConfig.key === 'rank' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}
          </span>
        </th>
        <th onClick={() => handleSort('mark')}>
          Marca 
          <span className="sortable">
            {sortConfig.key === 'mark' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}
          </span>
        </th>
        <th onClick={() => handleSort('name')}>
          Nome 
          <span className="sortable">
            {sortConfig.key === 'name' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}
          </span>
        </th>
        <th onClick={() => handleSort('category')}>
          Escalão 
          <span className="sortable">
            {sortConfig.key === 'category' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}
          </span>
        </th>
        <th onClick={() => handleSort('club')}>
          Clube 
          <span className="sortable">
            {sortConfig.key === 'club' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}
          </span>
        </th>
        <th onClick={() => handleSort('class')}>
          Classe 
          <span className="sortable">
            {sortConfig.key === 'class' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}
          </span>
        </th>
        <th onClick={() => handleSort('location')}>
          Local 
          <span className="sortable">
            {sortConfig.key === 'location' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}
          </span>
        </th>
        <th onClick={() => handleSort('wind')}>
          Vento 
          <span className="sortable">
            {sortConfig.key === 'wind' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}
          </span>
        </th>
        <th onClick={() => handleSort('date')}>
          Data 
          <span className="sortable">
            {sortConfig.key === 'date' ? (sortConfig.direction === 'ascending' ? '▲' : '▼') : '⇅'}
          </span>
        </th>
      </tr>
    </thead>
    <tbody>
      {filteredData.map((item, index) => (
        <tr key={index}>
          <td>{item.rank}</td>
          <td>{item.mark}</td>
          <td>{item.name}</td>
          <td>{item.category}</td>
          <td>{item.club}</td>
          <td>{item.class}</td>
          <td>{item.location}</td>
          <td>{item.wind}</td>
          <td>{item.date}</td>
        </tr>
      ))}
    </tbody>
  </table>
);


function Rankings() {
  const [data, setData] = useState(initialData);
  const [sortConfig, setSortConfig] = useState({ key: '', direction: 'ascending' });

  const handleSort = (key) => {
    let direction = 'ascending';
    if (sortConfig.key === key && sortConfig.direction === 'ascending') {
      direction = 'descending';
    } else {
      direction = 'ascending';
    }
    setSortConfig({ key, direction });
  };

  const sortedData = React.useMemo(() => {
    let sortableItems = [...data];
    if (sortConfig.key) {
      sortableItems.sort((a, b) => {
        if (a[sortConfig.key] < b[sortConfig.key]) {
          return sortConfig.direction === 'ascending' ? -1 : 1;
        }
        if (a[sortConfig.key] > b[sortConfig.key]) {
          return sortConfig.direction === 'ascending' ? 1 : -1;
        }
        return 0;
      });
    }
    return sortableItems;
  }, [data, sortConfig]);

  // Defining filters state
  const [filters, setFilters] = useState({

    prova: '',
    year: '',
    location: '',
    category: '',
    regularWind: false
  });

  const handleFilterChange = (e) => {
    const { name, value, type, checked } = e.target;
    setFilters(prevFilters => ({
      ...prevFilters,
      [name]: type === 'checkbox' ? checked : value
    }));
  };

  const filteredData = React.useMemo(() => sortedData.filter(item => {
    return  (filters.prova === '' || item.class.includes(filters.prova)) &&
           (filters.year === '' || item.date.startsWith(filters.year)) &&
           (filters.location === '' || item.location.includes(filters.location)) &&
           (filters.category === '' || item.category === filters.category) &&
           (!filters.regularWind || item.wind !== '-')
  }), [sortedData, filters]);

  return (
    <>
      <TheNavBar />
      <div className="background-container">
        <div className="content-container">
          <header>
  <h1>Rankings</h1>
  <section className="filters">
   
    <div className="filter">
      <label htmlFor="prova">Prova:</label>
      <select id="prova" name="prova" onChange={handleFilterChange} value={filters.prova}>
        <option value="">Todas</option>
        <option value="60m Dash">60m Dash</option>
        <option value="100m Dash">100m Dash</option>
        <option value="100m">100m</option>
        <option value="200m">200m</option>
        <option value="400m">400m</option>
      </select>
    </div>
    <div className="filter">
      <label htmlFor="year">Ano:</label>
      <select id="year" name="year" onChange={handleFilterChange} value={filters.year}>
        <option value="">Todos</option>
        <option value="2024">2024</option>
        <option value="2023">2023</option>
        <option value="2022">2022</option>
      </select>
    </div>
    <div className="filter">
      <label htmlFor="location">Local:</label>
      <select id="location" name="location" onChange={handleFilterChange} value={filters.location}>
        <option value="">Todos</option>
        <option value="Lisbon">Lisboa</option>
        <option value="Porto">Porto</option>
        <option value="Pombal">Pombal</option>
        <option value="Braga">Braga</option>
        <option value="Coimbra">Coimbra</option>
        <option value="Setúbal">Setúbal</option>
        <option value="Faro">Faro</option>
      </select>
    </div>
    <div className="filter">
      <label htmlFor="category">Escalão:</label>
      <select id="category" name="category" onChange={handleFilterChange} value={filters.category}>
        <option value="">Todos</option>
        <option value="Senior">Senior</option>
        <option value="Junior">Junior</option>
        <option value="Sub-23">Sub-23</option>
      </select>
    </div>
    <div className="filter">
      <label htmlFor="regularWind">Marcas com vento regular:</label>
      <input type="checkbox" id="regularWind" name="regularWind" onChange={handleFilterChange} checked={filters.regularWind} />
    </div>
  </section>
</header>
          <TableRankings filteredData={filteredData} handleSort={handleSort} sortConfig={sortConfig} />
        </div>
      </div>
      <Footer />
       <style jsx>{`
        .background-container {
          background-color: #ffe9e0; /* Light peach background */
          display: flex;
          justify-content: center;
          align-items: center;
          padding: 20px;
        }

        body {
          background-color: #ffe9e0; /* Light peach background */
        }

        .content-container {
          background-color: #ffffff; /* White background for the content */
          width: 90%; /* Content width */
          max-width: 1200px; /* Maximum width */
          padding: 20px;
          border-radius: 8px; /* Rounded corners */
          box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Subtle shadow */
          margin-top: 30px;
          justify-content: center;
          align-items: center;
        }

        .table.table-striped.table-hover.table-custom th {
          cursor: pointer;
          background-color: #ffc481;
        }

        .table-striped tbody tr:nth-child(even) {
          background-color: #ffc481; /* Set background color for even rows */
        }

        .table-striped tbody tr:nth-child(odd) {
          background-color: #ffffff; /* Set background color for odd rows */
        }

        .sortable {
          float: right;
        }

        header {
          margin-bottom: 20px;
        }

        h1 {
          text-align: center;
          margin-bottom: 20px;
        }

        .filters {
          display: flex;
          justify-content: center;
          gap: 20px;
          margin-bottom: 20px;
        }

        .filter {
          display: flex;
          flex-direction: column;
          align-items: center;
        }

        select, input[type="checkbox"] {
          padding: 8px;
          border: 1px solid #ccc;
          border-radius: 4px;
          margin-top: 5px;
        }

        .TableRankings {
          width: 100%;
          border-collapse: collapse;
        }

        .TableRankings th, .TableRankings td {
          border: 1px solid #ddd;
          text-align: left;
          padding: 8px;
        }

        .TableRankings th {
          background-color: #ffc481;
        }
      `}</style>
    </>
  );
}

export default Rankings;