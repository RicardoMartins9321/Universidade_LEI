import React from 'react';

const TableDefault = () => {
  return (
    <table className='table'>
      <thead>
        <tr>
          <th>Prova</th>
          <th>Marca</th>
          <th>Posição</th>
          <th>Data</th>
          <th>Local</th>
          <th>Ano</th>
          <th>Competição</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>60 Metros</td>
          <td>06.86</td>
          <td>1</td>
          <td>7/1/2020</td>
          <td>Oeiras</td>
          <td>2020</td>
          <td>Desafio Velocidade Furiosa</td>
        </tr>
        <tr>
          <td>100 Metros</td>
          <td>11.09</td>
          <td>1</td>
          <td>5/4/2019</td>
          <td>Faro</td>
          <td>2019</td>
          <td>Campeonato Regional Provas Combinadas - Juniores e Seniores</td>
        </tr>
        <tr>
          <td>150 Metros</td>
          <td>15.78</td>
          <td>1</td>
          <td>7/1/2020</td>
          <td>Oeiras</td>
          <td>2020</td>
          <td>Desafio Velocidade Furiosa</td>
        </tr>
        <tr>
          <td>200 Metros</td>
          <td>21.01</td>
          <td>1</td>
          <td>2022-02-26</td>
          <td>Pombal</td>
          <td>2022</td>
          <td>Campeonatos de Portugal em Pista Coberta</td>
        </tr>
        <tr>
          <td>300 Metros</td>
          <td>33.55</td>
          <td>1</td>
          <td>7/8/2020</td>
          <td>Lisboa</td>
          <td>2020</td>
          <td>Desafio Vertigens do Tartan</td>
        </tr>
        <tr>
          <td>400 Metros</td>
          <td>45.41</td>
          <td>1</td>
          <td>7/2/2022</td>
          <td>Oran-ALG</td>
          <td>2022</td>
          <td>Oran-ALG</td>
        </tr>
      </tbody>
    </table>
  );
};

export default TableDefault;
