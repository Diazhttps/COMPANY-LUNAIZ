import React, { useState } from 'react';
import './Login.css';
import { motion } from 'framer-motion'; 
import 'animate.css';

function Login({ onSuccess, onChangeView }) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [message, setMessage] = useState('');

  const handleLogin = async (e) => {
    e.preventDefault();

    try {
      const response = await fetch('http://localhost/mi_api/login.php', {
        method: 'POST',
        credentials: 'include', // IMPORTANTE: permite el manejo de cookies (sesión)
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ email, password })
      });

      const data = await response.json();

      if (response.ok && data.success) {
        setMessage(`Bienvenido, ${data.user.username || 'usuario'}`);
        onSuccess();
      } else {
        setMessage(data.message || 'Credenciales inválidas');
      }
    } catch (error) {
      setMessage(`Error de conexión: ${error.message}`);
    }
  };

  return (
    <div className="App">
      <header className="App-header">
        <motion.h2
          className="animate__animated animate__lightSpeedInLeft"
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.3 }}
        >
          Iniciar Sesión
        </motion.h2>

        <form
          onSubmit={handleLogin}
          className="login-form"
        >
          <input
            type="email"
            placeholder="Correo electrónico"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            required
          />
          <input
            type="password"
            placeholder="Contraseña"
            value={password}
            onChange={(e) => setPassword(e.target.value)}
            required
          />

          <motion.button
            type="submit"
            className="login-button"
            whileHover={{ scale: 1.05 }}
            whileTap={{ scale: 0.95 }}
          >
            Iniciar sesión
          </motion.button>
        </form>

        <motion.button
          onClick={onChangeView}
          className="login-button"
          whileHover={{ scale: 1.05 }}
          whileTap={{ scale: 0.95 }}
        >
          ¿No tienes cuenta? Regístrate aquí
        </motion.button>

        {message && (
          <motion.p
            className="login-message"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
          >
            {message}
          </motion.p>
        )}
      </header>
    </div>
  );
}

export default Login;
