import React, { useState } from 'react';
import './Register.css';
import { motion } from 'framer-motion';
import 'animate.css';

function Register({ onChangeView }) {
  const [username, setUsername] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [message, setMessage] = useState('');

  const handleRegister = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch("http://localhost/mi_api/register.php", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ username, email, password })
      });

      if (!response.ok) throw new Error('Error en la respuesta del servidor');

      const data = await response.json();
      setMessage(data.message);
    } catch (error) {
      setMessage("Error de conexión: " + error.message);
    }
  };

  return (
    <div className="login-container-register">
      <div className="login-box-register">
        <motion.h2
          className="animate__animated animate__lightSpeedInLeft"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.3 }}
        >
          Registro
        </motion.h2>

        <form onSubmit={handleRegister}>
          <input
            type="text"
            placeholder="Nombre de usuario"
            value={username}
            onChange={e => setUsername(e.target.value)}
            required
          />
          <input
            type="email"
            placeholder="Correo electrónico"
            value={email}
            onChange={e => setEmail(e.target.value)}
            required
          />
          <input
            type="password"
            placeholder="Contraseña"
            value={password}
            onChange={e => setPassword(e.target.value)}
            required
          />
          <motion.button
            type="submit"
            whileHover={{ scale: 1.05 }}
            whileTap={{ scale: 0.95 }}
          >
            Registrarse
          </motion.button>
        </form>

        <motion.button
          onClick={onChangeView}
          whileHover={{ scale: 1.05 }}
          whileTap={{ scale: 0.95 }}
        >
          ¿Ya tienes cuenta? Inicia sesión aquí 
        </motion.button>

        {message && <p style={{ marginTop: '15px' }}>{message}</p>}
      </div>
    </div>
  );
}

export default Register;
