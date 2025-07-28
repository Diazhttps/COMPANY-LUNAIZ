import React, { useState, useEffect } from 'react';

function EditPelicula({ id, onClose, onPeliculaUpdated }) {
  const [pelicula, setPelicula] = useState({
    id: '',
    titulo: '',
    director: '',
    actores: '',
    presupuesto: '',
    productora: '',
  });

  const [loading, setLoading] = useState(false);
  const [mensaje, setMensaje] = useState('');

  useEffect(() => {
    if (!id) return;

    const fetchPelicula = async () => {
      setLoading(true);
      try {
        const res = await fetch(`http://localhost/mi_api/get_pelicula.php?id=${id}`, {
          credentials: 'include', // Asegura envío de cookie
        });
        if (!res.ok) throw new Error(`HTTP error! Status: ${res.status}`);

        const data = await res.json();

        if (data.success) {
          const {
            id = '',
            titulo = '',
            director = '',
            actores = '',
            presupuesto = '',
            casa_productora = '',
          } = data.data;

          setPelicula({
            id,
            titulo,
            director,
            actores,
            presupuesto,
            productora: casa_productora, // Correcto mapeo
          });
          setMensaje('');
        } else {
          setMensaje(data.message || 'Error al obtener película');
        }
      } catch (error) {
        setMensaje('Error de conexión');
        console.error(error);
      } finally {
        setLoading(false);
      }
    };

    fetchPelicula();
  }, [id]);

  const handleChange = (e) => {
    setPelicula({ ...pelicula, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setMensaje('');

    try {
      const res = await fetch('http://localhost/mi_api/update_pelicula.php', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        credentials: 'include', // 🔑 Este sí es clave
        body: JSON.stringify(pelicula),
      });

      if (!res.ok) throw new Error(`HTTP error! Status: ${res.status}`);

      const data = await res.json();

      if (data.success) {
        setMensaje('Película actualizada con éxito');
        onPeliculaUpdated(); // Refresca la lista
        onClose(); // Cierra el modal
      } else {
        setMensaje(data.message || 'Error al actualizar');
      }
    } catch (error) {
      setMensaje('Error de conexión con el servidor');
      console.error(error);
    } finally {
      setLoading(false);
    }
  };

  if (loading && !pelicula.id) return <p>Cargando...</p>;

  return (
    <div className="edit-pelicula-form">
      <h3>Editar Película</h3>
      {mensaje && <p className="mensaje">{mensaje}</p>}
      <form onSubmit={handleSubmit}>
        <input
          name="titulo"
          value={pelicula.titulo}
          onChange={handleChange}
          required
          disabled={loading}
          placeholder="Título"
        />
        <input
          name="director"
          value={pelicula.director}
          onChange={handleChange}
          required
          disabled={loading}
          placeholder="Director"
        />
        <input
          name="actores"
          value={pelicula.actores}
          onChange={handleChange}
          required
          disabled={loading}
          placeholder="Actores"
        />
        <input
          name="presupuesto"
          value={pelicula.presupuesto}
          onChange={handleChange}
          required
          disabled={loading}
          placeholder="Presupuesto"
          type="number"
          min="0"
        />
        <input
          name="productora"
          value={pelicula.productora}
          onChange={handleChange}
          required
          disabled={loading}
          placeholder="Productora"
        />
        <button type="submit" disabled={loading}>
          {loading ? 'Actualizando...' : 'Actualizar'}
        </button>
        <button type="button" onClick={onClose} disabled={loading}>
          Cancelar
        </button>
      </form>
    </div>
  );
}

export default EditPelicula;
