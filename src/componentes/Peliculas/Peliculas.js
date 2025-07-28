import React, { useEffect, useState } from 'react';
import { motion } from 'framer-motion';
import 'animate.css';
import './Peliculas.css';
import EditPelicula from './EditPelicula';
import { FaEdit, FaTrash } from 'react-icons/fa';

function Peliculas({ filtroBusqueda, setFiltroBusqueda }) {
  const [peliculas, setPeliculas] = useState([]);
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);
  const [peliculaEditId, setPeliculaEditId] = useState(null);
  const [paginaActual, setPaginaActual] = useState(1);
  const peliculasPorPagina = 10;

  const formatearNombreArchivo = (titulo) =>
    titulo.toLowerCase().replace(/\s+/g, '_').replace(/[^a-z0-9_]/g, '');

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

  const totalPaginas = Math.ceil(peliculasFiltradas.length / peliculasPorPagina);

  const peliculasPaginaActual = peliculasFiltradas.slice(
    (paginaActual - 1) * peliculasPorPagina,
    paginaActual * peliculasPorPagina
  );

  return (
    <div className="movies-container">
      <div className="titulo-container">
        <motion.h1
          className="animate__animated animate__fadeInDown titulo-principal"
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.2 }}
        >
          LunaizHub
        </motion.h1>
        <motion.p
          className="animate__animated animate__fadeInDown eslogan"
          initial={{ opacity: 0, y: 10 }}
          animate={{ opacity: 1, y: 0 }}
          transition={{ delay: 0.4 }}
        >
          La mejor forma para pasar el tiempo🍿
        </motion.p>
      </div>

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
        {peliculasPaginaActual.map((peli, index) => (
          <motion.div
            key={peli.id}
            className="pelicula-card flip-card"
            whileHover={{ scale: 1.02 }}
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ delay: 0.05 }}
          >
            <div className="flip-card-inner">
              <div className="flip-card-front">
                <img
                  src={`/posters/${formatearNombreArchivo(peli.titulo)}.jpg`}
                  alt={`Poster de ${peli.titulo}`}
                />
              </div>

              <div className="flip-card-back">
                <h3>{(paginaActual - 1) * peliculasPorPagina + index + 1}. {peli.titulo}</h3>
                <p><strong>🎬 Director:</strong> {peli.director}</p>
                <p><strong>🎭 Actores:</strong> {peli.actores}</p>
                <p><strong>💰 Presupuesto:</strong> ${parseFloat(peli.presupuesto).toLocaleString()}</p>
                <p><strong>🏢 Productora:</strong> {peli.casa_productora}</p>
                
                {/* SISTEMA DE CALIFICACIÓN VISUAL */}
                <div className="estrellas-calificacion">
                  {[...Array(5)].map((_, i) => (
                    <span key={i} className={i < (peli.calificacion || 3) ? 'estrella llena' : 'estrella vacia'}>
                      ★
                    </span>
                  ))}
                </div>

                <div className="botones-acciones">
                  <button onClick={() => setPeliculaEditId(peli.id)}>
                    <FaEdit style={{ marginRight: '6px' }} /> Editar
                  </button>
                  <button onClick={() => eliminarPelicula(peli.id)}>
                    <FaTrash style={{ marginRight: '6px' }} /> Eliminar
                  </button>
                </div>
              </div>
            </div>
          </motion.div>
        ))}
      </div>

      <div className="paginacion">
        {[...Array(totalPaginas)].map((_, i) => (
          <button
            key={i}
            onClick={() => setPaginaActual(i + 1)}
            className={paginaActual === i + 1 ? 'activo' : ''}
          >
            {i + 1}
          </button>
        ))}
      </div>
    </div>
  );
}

export default Peliculas;
