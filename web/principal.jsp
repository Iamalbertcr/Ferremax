<%-- 
    Document   : principal
    Created on : 29 nov 2025, 4:28:12?p. m.
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

<a href="logout.jsp">Cerrar sesión</a>

