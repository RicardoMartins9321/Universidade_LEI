import React from 'react';

const TableSeasonBest = () => {
  return (
    <table className='table'>
      <thead>
        <tr>
          <th>Prova</th>
          <th>Marca</th>
          <th>Posição</th>
          <th>Data</th>
          <th>Local</th>
          <th>Competição</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>60 Metros</td>
          <td>6.86</td>
          <td>1</td>
          <td>2024/01/07</td>
          <td>Oeiras</td>
          <td>Desafio Velocidade Furiosa</td>
        </tr>
        <tr>
          <td>100 Metros</td>
          <td>10.09</td>
          <td>1</td>
          <td>2024/05/04</td>
          <td>Faro</td>
          <td>Campeonato Regional Provas Combinadas - Juniores e Seniores</td>
        </tr>
        <tr>
          <td>400 Metros</td>
          <td>45.41</td>
          <td>1</td>
          <td>2024/02/07</td>
          <td>Oran-ALG</td>
          <td>Desafio Vertigens do Tartan</td>
        </tr>
      </tbody>
    </table>
  );
};

export default TableSeasonBest;
