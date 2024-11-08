import React from 'react';
import ReactDOM from 'react-dom/client';
import './index.css';
import {  createBrowserRouter,RouterProvider } from "react-router-dom";
import Login from './Login';
import Register from './Register';
import ContractPage from './ContractPage';
import MainPage from './Mainpage';
import Competions from './Competions';
import Competion from './Competion';
import AthletesSearch from './AthletesSearch';
import AthleteProfile from './AthleteProfile';
import ClubsSearch from './ClubsSearch';
import ClubProfile from './ClubProfile';
import Rankings from './Rankings';
import Incricoes from './Incricoes';
import Incritos from './Incritos';
import Marcas from './Marcas1';

const router=createBrowserRouter([{
  path:"/",
  element:<MainPage/>,
},
{
  path:"/login",
  element:<Login/>,
},
{
  path:"/register",
  element:<Register/>,
},
{
  path:"/terms",
  element:<ContractPage/>,
},
{
  path:"/competion/:id",
  element:<Competion/>,
}
,
{
  path:"/competions",
  element:<Competions/>,
},
{
  path:"/AthletesSearch",
  element:<AthletesSearch/>,
},
{
  path: "/profile/:name", // Use a dynamic segment to capture the athlete's name
  element: <AthleteProfile/>,
},
{
  path:"/ClubsSearch",
  element:<ClubsSearch/>,
},
{
  path: "/club-profile/:name", // Route for club profiles
  element: <ClubProfile />,
},
{
  path: "/Incritos/:name", // Route for club profiles
  element: <Incritos />,
},
{
  path: "/Marcas/:name", // Route for club profiles
  element: <Marcas/>,
},
{
  path: "/Incricoes/:name", // Route for club profiles
  element: <Incricoes/>,
},
{
  path: "/club-profile/:sigla", // Route for club profiles
  element: <ClubProfile />,
},
{
  path:"/Rankings",
  element:<Rankings/>,
},
]);

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
  <React.StrictMode>
    <RouterProvider router={router}/>
  </React.StrictMode>
);



// If you want to start measuring performance in your Login, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals

