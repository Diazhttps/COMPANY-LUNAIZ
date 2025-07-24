import React, { useEffect, useState } from 'react';
import './Peliculas.css';
import { motion } from 'framer-motion';
import 'animate.css';

function Peliculas() {
  const [peliculas, setPeliculas] = useState([]);
  const [error, setError] = useState('');

  useEffect(() => {
    fetch('http://localhost/mi_api/get_peliculas.php', {
      method: 'GET',
      credentials: 'include'
    })
      .then(response => {
        if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`);
        return response.json();
      })
      .then(data => {
        if (data.success) {
          setPeliculas(data.data);
        } else {
          setError(data.message || 'Sesión no iniciada. Inicie sesión primero.');
        }
      })
      .catch(err => {
        setError('Error al conectar con el servidor');
        console.error(err);
      });
  }, []);

  return (
    <div className="peliculas-container">
      <motion.h2
        className="animate__animated animate__fadeInDown"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 0.2 }}
      >
        🎬 Listado de Películas
      </motion.h2>

      {error && (
        <motion.p className="error" initial={{ opacity: 0 }} animate={{ opacity: 1 }}>
          ⚠️ {error}
        </motion.p>
      )}

      {!error && peliculas.length === 0 && (
        <motion.p initial={{ opacity: 0 }} animate={{ opacity: 1 }}>
          No hay películas registradas en el sistema.
        </motion.p>
      )}

      <div className="peliculas-grid">
        {peliculas.map((peli, idx) => (
          <motion.div
            key={idx}
            className="pelicula-card"
            whileHover={{ scale: 1.04 }}
            whileTap={{ scale: 0.96 }}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: idx * 0.05 }}
          >
            <h3>{peli.titulo}</h3>
            <p><strong>🎬 Director:</strong> {peli.director}</p>
            <p><strong>🎭 Actores:</strong> {peli.actores}</p>
            <p><strong>💰 Presupuesto:</strong> ${parseFloat(peli.presupuesto).toLocaleString()}</p>
            <p><strong>🏢 Productora:</strong> {peli.casa_productora}</p>
          </motion.div>
        ))}
      </div>
    </div>
  );
}

export default Peliculas;
