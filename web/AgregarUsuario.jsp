<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Agregar Usuario</title>
    <style>
        body {
            font-family: Arial;
            background: #efefef;
        }
        .card {
            width: 450px;
            margin: 60px auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 8px;
            margin-bottom: 15px;
            border-radius: 6px;
            border: 1px solid gray;
        }
        button {
            padding: 10px 20px;
            border: none;
            background: #2196F3;
            color: white;
            border-radius: 6px;
            cursor: pointer;
        }
        .volver {
            display: inline-block;
            margin-top: 10px;
            text-decoration: none;
        }
        .mensaje {
            padding: 12px;
            border-radius: 6px;
            margin-bottom: 15px;
            font-weight: bold;
            text-align: center;
        }
        .exito {
            background: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
        }
        .error {
            background: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
        }
    </style>
</head>
<body>

<div class="card">
    <h2 style="text-align:center;">Agregar Usuario</h2>

    <!-- MENSAJES DE EXITO / ERROR -->
    <%
        if (request.getAttribute("mensaje") != null) {
    %>
        <div class="mensaje exito"><%= request.getAttribute("mensaje") %></div>
    <%
        }
        if (request.getAttribute("error") != null) {
    %>
        <div class="mensaje error"><%= request.getAttribute("error") %></div>
    <%
        }
    %>

    <form action="UsuarioServlet" method="post">
        <input type="hidden" name="accion" value="agregar">

        Usuario:
        <input type="text" name="usuario" required>

        Contraseña:
        <input type="password" name="contrasena" required>

        Rol:
        <select name="rol" required>
            <option value="administrador">Administrador</option>
            <option value="empleado">Empleado</option>
        </select>

        <button type="submit">Agregar</button>
    </form>

    <a class="volver" href="index.jsp">⬅ Volver</a>
</div>

</body>
</html>
