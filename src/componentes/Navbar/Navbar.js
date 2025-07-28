import React, { useEffect, useState } from 'react';
import './Navbar.css';

function Navbar({ onSearch, onGoHome }) {
  const [usuario, setUsuario] = useState(null);
  const [busqueda, setBusqueda] = useState('');

  useEffect(() => {
    const fetchUsuario = async () => {
      try {
        const res = await fetch('http://localhost/mi_api/get_user.php', {
          method: 'GET',
          credentials: 'include',
        });
        const data = await res.json();
        if (data.success) setUsuario(data.user.username || data.user);
      } catch (error) {
        console.error('Error al obtener el usuario:', error);
      }
    };
    fetchUsuario();
  }, []);

  const handleLogout = async () => {
    try {
      const res = await fetch('http://localhost/mi_api/logout.php', {
        method: 'POST',
        credentials: 'include',
      });
      if (res.ok) {
        window.location.reload();
      } else {
        alert('Error al cerrar sesión.');
      }
    } catch {
      alert('Error de conexión al cerrar sesión.');
    }
  };

  const handleBusquedaChange = (e) => {
    const valor = e.target.value;
    setBusqueda(valor);
    if (onSearch) onSearch(valor);
  };

  const handleInicioClick = (e) => {
    e.preventDefault();
    if (onGoHome) onGoHome();
  };

  return (
    <nav className="navbar">
      <div className="navbar-brand">🎥 LunaizHub</div>

      <ul className="navbar-links">
        <li>
          <a href="http://localhost:3000" onClick={handleInicioClick}>
            Inicio
          </a>
        </li>
        <li><a href="#">Agregar</a></li>
        <li>
          <input
            type="search"
            placeholder="Buscar..."
            aria-label="Buscar"
            value={busqueda}
            onChange={handleBusquedaChange}
            className="search-input"
          />
        </li>
        <li>
          {usuario ? (
            <span className="usuario-perfil">👤 {usuario}</span>
          ) : (
            <span className="usuario-perfil">👤 Invitado</span>
          )}
        </li>
        <li>
          <button className="logout-btn" onClick={handleLogout}>
            Cerrar Sesión
          </button>
        </li>
      </ul>
    </nav>
  );
}

export default Navbar;
