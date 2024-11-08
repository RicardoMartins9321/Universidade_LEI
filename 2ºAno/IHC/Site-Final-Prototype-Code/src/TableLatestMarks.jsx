import React from 'react';
import { Link } from "react-router-dom";


const AthletesLatestMarks = () => {
  return (
    <table className='table'>
      <thead>
        <tr>
          <th>Prova</th>
          <th>Marca</th>
          <th>Posição</th>
          <th>Clube</th>
          <th>Data</th>
          <th>Competição</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>200 Metros</td>
          <td>21.49</td>
          <td>2</td>
          <td>SLB</td>
          <td>2020-06-26</td>
          <td><Link to={"/competion/1"}>Campeonatos Nacionais 2020</Link></td>
        </tr>
        <tr>
          <td>400 Metros</td>
          <td>47.08</td>
          <td>3</td>
          <td>SCP</td>
          <td>2021-06-12</td>
          <td>Campeonato Nacional de Esperanças</td>
        </tr>
        <tr>
          <td>400 Metros</td>
          <td>47.21</td>
          <td>3</td>
          <td>SCP</td>
          <td>2021-06-23</td>
          <td>MEETING MAIA CIDADE DESPORTO 2021</td>
        </tr>
        <tr>
          <td>400 Metros</td>
          <td>47.25</td>
          <td>1</td>
          <td>SCP</td>
          <td>2022-02-19</td>
          <td>1ª Divisão - Campeonatos Nacionais de Clubes em Pista Coberta</td>
        </tr>
        <tr>
          <td>400 Metros</td>
          <td>47.37</td>
          <td>1</td>
          <td>SCP</td>
          <td>2022-02-26</td>
          <td>Campeonatos de Portugal em Pista Coberta</td>
        </tr>
        <tr>
          <td>200 Metros</td>
          <td>21.01</td>
          <td>1</td>
          <td>SCP</td>
          <td>2022-02-26</td>
          <td>Campeonatos de Portugal em Pista Coberta</td>
        </tr>
        <tr>
          <td>200 Metros</td>
          <td>21.18</td>
          <td>1</td>
          <td>SCP</td>
          <td>2022-05-28</td>
          <td>Lisboa | Campeonato Nacional de Clubes - Apuramento</td>
        </tr>
        <tr>
          <td>200 Metros</td>
          <td>21.18</td>
          <td>1</td>
          <td>SCP</td>
          <td>2022-05-28</td>
          <td>Campeonato Nacional de Clubes - Fase de Apuramento</td>
        </tr>
        <tr>
          <td>400 Metros</td>
          <td>47.10</td>
          <td>1</td>
          <td>SCP</td>
          <td>2022-06-25</td>
          <td>Campeonatos de Portugal</td>
        </tr>
        <tr>
          <td>400 Metros</td>
          <td>46.86</td>
          <td>1</td>
          <td>SCP</td>
          <td>2022-07-30</td>
          <td>1ª Divisão - Campeonatos Nacionais de Clubes - Fase Final</td>
        </tr>
        <tr>
          <td>200 Metros</td>
          <td>21.13</td>
          <td>2</td>
          <td>SCP</td>
          <td>2022-07-30</td>
          <td>1ª Divisão - Campeonatos Nacionais de Clubes - Fase Final</td>
        </tr>
        <tr>
          <td>400 Metros</td>
          <td>47.10</td>
          <td>1</td>
          <td>SCP</td>
          <td>2023-02-11</td>
          <td>1ª Divisão - Campeonatos Nacionais de Clubes em Pista Coberta</td>
        </tr>
        <tr>
          <td>400 Metros</td>
          <td>47.04</td>
          <td>1</td>
          <td>SCP</td>
          <td>2023-01-22</td>
          <td>MEETING MONIZ PEREIRA</td>
        </tr>
        <tr>
          <td>400 Metros</td>
          <td>46.91</td>
          <td>1</td>
          <td>SCP</td>
          <td>2023-02-18</td>
          <td>Campeonatos de Portugal em Pista Coberta</td>
        </tr>
        <tr>
          <td>400 Metros</td>
          <td>46.51</td>
          <td>2</td>
          <td>SCP</td>
          <td>2023-07-22</td>
          <td>Campeonatos Nacionais de Clubes - 1ª Divisão</td>
        </tr>
        <tr>
          <td>400 Metros</td>
          <td>46.58</td>
          <td>1</td>
          <td>SCP</td>
          <td>2024-02-17</td>
          <td>Campeonatos de Portugal de Pista Coberta</td>
        </tr>
        <tr>
          <td>400 Metros</td>
          <td>46.52</td>
          <td>1</td>
          <td>SCP</td>
          <td>2024-02-10</td>
          <td>Campeonatos Nacionais de Clubes em Pista Coberta - 1ª Divisão</td>
        </tr>
      </tbody>
    </table>
  );
};

export default AthletesLatestMarks;
