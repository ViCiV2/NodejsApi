const pool = require("../db");

const getAllUsers = async (req, res) => {
  try {
    const result = await pool.query(
      "SELECT id, nombre, apellido1, apellido2, email, telefono, rol, estatus, foto_url FROM usuarios"
    );
    res.json(result.rows);
  } catch (error) {
    res.json({ error: error.message });
    next(error);
  }
};

const getUser = async (req, res) => {
  try {
    const { id } = req.params;
    const result = await pool.query(
      `SELECT 
          u.id, u.nombre, u.apellido1, u.apellido2, u.email, u.telefono, 
          u.rol, u.foto_url, u.estatus, 
          d.calle, d.colonia, d.ciudad, d.cp, d.num_calle
        FROM usuarios u
        LEFT JOIN direccion d ON u.id = d.id_usuario
        WHERE u.id = $1`,
      [id]
    );

    if (result.rows.length === 0) {
      return res.status(404).json({ error: "Usuario no encontrado" });
    }

    const user = result.rows[0];
    const response = {
      id: user.id,
      nombre: user.nombre,
      apellido1: user.apellido1,
      apellido2: user.apellido2,
      email: user.email,
      telefono: user.telefono,
      rol: user.rol,
      foto_url: user.foto_url,
      estatus: user.estatus,
      direccion: {
        calle: user.calle,
        colonia: user.colonia,
        ciudad: user.ciudad,
        cp: user.cp,
        num_calle: user.num_calle
      },
    };
    res.json(response);
  } catch (error) {
    res.json({ error: error.message });
  }
};

const deleteUser = async (req, res) => {
  const { id } = req.params;

  try {
    await pool.query("DELETE FROM direccion WHERE id_usuario = $1", [id]);

    const result = await pool.query(
      "DELETE FROM usuarios WHERE id = $1 RETURNING *",
      [id]
    );

    if (result.rowCount === 0) {
      return res.status(404).json({ error: "Usuario no encontrado" });
    }
    res.json({
      message: "Usuario y dirección eliminados correctamente",
      user: result.rows[0],
    });
  } catch (error) {
    res.json({ error: error.message });
    next(error);
  }
};

const updateUser = async (req, res) => {
    const { id } = req.params; // Obtenemos el ID del usuario desde los parámetros de la URL
    const {
      nombre,
      apellido1,
      apellido2,
      email,
      telefono,
      rol,
      foto_url,
      estatus,
      calle,
      colonia,
      ciudad,
      cp,
      num_calle,
    } = req.body;
  
    try {
      // Actualizar el usuario
      const resultUser = await pool.query(
        "UPDATE usuarios SET nombre = $1, apellido1 = $2, apellido2 = $3, email = $4, telefono = $5, rol = $6, foto_url = $7, estatus = $8 WHERE id = $9 RETURNING *",
        [nombre, apellido1, apellido2, email, telefono, rol, foto_url, estatus, id]
      );
  
      if (resultUser.rowCount === 0) {
        return res.status(404).json({ error: "Usuario no encontrado" });
      }
  
      // Actualizar la dirección asociada al usuario
      const resultAddress = await pool.query(
        "UPDATE direccion SET calle = $1, colonia = $2, ciudad = $3, cp = $4, num_calle = $5 WHERE id_usuario = $6 RETURNING *",
        [calle, colonia, ciudad, cp, num_calle, id]
      );
  
      if (resultAddress.rowCount === 0) {
        return res.status(404).json({ error: "Dirección no encontrada para el usuario" });
      }
  
      // Responder con los datos actualizados
      res.json({
        message: "Usuario y dirección actualizados correctamente",
        user: resultUser.rows[0],
        address: resultAddress.rows[0],
      });
    } catch (error) {
      res.json({ error: error.message });
      next(error);
    }
};

const createUser = async (req, res) => {
  const {
    nombre,
    apellido1,
    apellido2,
    email,
    telefono,
    rol,
    foto_url,
    estatus,
    calle,
    colonia,
    ciudad,
    cp,
    num_calle,
  } = req.body;

  try {
    const result = await pool.query(
      "INSERT INTO usuarios (nombre, apellido1, apellido2, email, telefono, rol, foto_url, estatus) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING id",
      [nombre, apellido1, apellido2, email, telefono, rol, foto_url, estatus]
    );

    const userId = result.rows[0].id;

    await pool.query(
      "INSERT INTO direccion (id_usuario, calle, colonia, ciudad, cp, num_calle) VALUES ($1, $2, $3, $4, $5, $6)",
      [userId, calle, colonia, ciudad, cp, num_calle]
    );

    const userResponse = {
      id: userId,
      nombre,
      apellido1,
      apellido2,
      email,
      telefono,
      rol,
      foto_url,
      estatus,
      direccion: {
        calle,
        colonia,
        ciudad,
        cp,
        num_calle,
      },
    };

    res.json(userResponse);
  } catch (error) {
    res.json({ error: error.message });
    next(error);
  }
};

module.exports = {
  getAllUsers,
  getUser,
  deleteUser,
  updateUser,
  createUser,
};
