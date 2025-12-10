<%-- 
    Document   : logout
    Created on : 29 nov 2025, 4:28:33?p. m.
    Author     : hidal
--%>

<%@ page session="true"%>
<%
    String usuario = (String) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.html");
    }
%>

<h1>Bienvenido a Ferremax</h1>
<p>Usuario conectado: <%= usuario %></p>

<a href="logout.html">Cerrar sesión</a>
