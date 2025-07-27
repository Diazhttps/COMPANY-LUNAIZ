import React, { useState } from 'react';
import Login from './componentes/Login/Login';
import Register from './componentes/Register/Register';
import Peliculas from './componentes/Peliculas/Peliculas';
import Navbar from './componentes/Navbar/Navbar';
import './App.css';

function App() {
  const [vista, setVista] = useState('login');
  const [filtroBusqueda, setFiltroBusqueda] = useState('');

  const handleLoginSuccess = () => {
    setVista('peliculas');
  };

  const handleGoHome = () => {
    setVista('peliculas');
    setFiltroBusqueda('');
  };

  return (
    <div className="App">
      {vista === 'login' && (
        <Login
          onSuccess={handleLoginSuccess}
          onChangeView={() => setVista('register')}
        />
      )}
      {vista === 'register' && (
        <Register onChangeView={() => setVista('login')} />
      )}
      {vista === 'peliculas' && (
        <>
          <Navbar onSearch={setFiltroBusqueda} onGoHome={handleGoHome} />
          <Peliculas filtroBusqueda={filtroBusqueda} setFiltroBusqueda={setFiltroBusqueda} />
        </>
      )}
    </div>
  );
}

export default App;
