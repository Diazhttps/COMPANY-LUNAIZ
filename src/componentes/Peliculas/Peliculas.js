import React, { useEffect, useState } from 'react';
import { motion } from 'framer-motion';
import 'animate.css';
import './Peliculas.css';
// Importación Navbar eliminada para evitar duplicados
import EditPelicula from './EditPelicula';

function Peliculas({ filtroBusqueda, setFiltroBusqueda }) {
  const [peliculas, setPeliculas] = useState([]);
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const [peliculaEditId, setPeliculaEditId] = useState(null);

  const fetchPeliculas = async () => {
    setLoading(true);
    setError('');
    try {
      const res = await fetch('http://localhost/mi_api/get_peliculas.php', {
        method: 'GET',
        credentials: 'include',
      });

      if (!res.ok) throw new Error(`HTTP error! Status: ${res.status}`);

      const data = await res.json();

      if (data.success) {
        setPeliculas(data.data);
      } else {
        setError(data.message || 'Sesión no iniciada. Inicie sesión primero.');
      }
    } catch (error) {
      setError('Error al conectar con el servidor');
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchPeliculas();
  }, []);

  const eliminarPelicula = async (id) => {
    if (!window.confirm('¿Seguro que quieres eliminar esta película?')) return;

    try {
      const res = await fetch(`http://localhost/mi_api/delete_pelicula.php?id=${id}`, {
        method: 'DELETE',
        credentials: 'include',
      });

      if (!res.ok) throw new Error(`HTTP error! Status: ${res.status}`);

      const data = await res.json();

      if (data.success) {
        setPeliculas((prev) => prev.filter((p) => p.id !== id));
      } else {
        alert('Error al eliminar: ' + data.message);
      }
    } catch (error) {
      alert('Error en la petición de eliminar');
      console.error(error);
    }
  };

  const onActualizarLista = () => {
    fetchPeliculas();
    setPeliculaEditId(null);
  };

  const peliculasFiltradas = peliculas.filter((peli) => {
    const texto = filtroBusqueda.toLowerCase();
    return (
      peli.titulo.toLowerCase().includes(texto) ||
      peli.director.toLowerCase().includes(texto) ||
      peli.actores.toLowerCase().includes(texto) ||
      peli.presupuesto.toString().includes(texto) ||
      peli.casa_productora.toLowerCase().includes(texto)
    );
  });

  return (
    <div className="movies-container">
      <motion.h2
        className="animate__animated animate__fadeInDown"
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 0.2 }}
      >
        🎬 Listado de Películas
      </motion.h2>

      {peliculaEditId && (
        <EditPelicula
          id={peliculaEditId}
          onPeliculaUpdated={onActualizarLista}
          onClose={() => setPeliculaEditId(null)}
        />
      )}

      {loading && <p>Cargando películas...</p>}

      {error && (
        <motion.p className="error" initial={{ opacity: 0 }} animate={{ opacity: 1 }}>
          ⚠️ {error}
        </motion.p>
      )}

      {!loading && !error && peliculasFiltradas.length === 0 && (
        <motion.p initial={{ opacity: 0 }} animate={{ opacity: 1 }}>
          No se encontraron resultados para tu búsqueda.
        </motion.p>
      )}

      <div className="peliculas-grid">
        {peliculasFiltradas.map((peli) => (
          <motion.div
            key={peli.id}
            className="pelicula-card"
            whileHover={{ scale: 1.04 }}
            whileTap={{ scale: 0.96 }}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.05 }}
          >
            <h3>{peli.titulo}</h3>
            <p>
              <strong>🎬 Director:</strong> {peli.director}
            </p>
            <p>
              <strong>🎭 Actores:</strong> {peli.actores}
            </p>
            <p>
              <strong>💰 Presupuesto:</strong> ${parseFloat(peli.presupuesto).toLocaleString()}
            </p>
            <p>
              <strong>🏢 Productora:</strong> {peli.casa_productora}
            </p>
            <div className="botones-acciones">
              <button onClick={() => setPeliculaEditId(peli.id)}>Editar</button>
              <button onClick={() => eliminarPelicula(peli.id)}>Eliminar</button>
            </div>
          </motion.div>
        ))}
      </div>
    </div>
  );
}

export default Peliculas;
