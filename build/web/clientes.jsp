<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, modelo.Cliente" %>
<%
    List<Cliente> lista = (List<Cliente>) request.getAttribute("lista");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Clientes</title>
    <link rel="stylesheet" href="ClieProdStyle.css">
</head>
<body>

<h2>Listado de Clientes</h2>
<a class="volverAlpanel" href="panel.jsp"></a> <!-- Este es el volver al panel pero con icono 
                                                                para que salga al principio de la pagina -->

<br>

<a class="btn btn-add" href="ClienteServlet?accion=nuevo">+ Agregar Cliente</a>

<table>
    <tr>
        <th>ID</th><th>Nombre</th><th>Cédula</th><th>Correo</th><th>Acciones</th>
    </tr>

    <% if(lista != null) { 
        for(Cliente c : lista) { %>

            <tr>
                <td><%= c.getId() %></td>
                <td><%= c.getNombre() %></td>
                <td><%= c.getCedula() %></td>
                <td><%= c.getCorreo() %></td>
                <td>
                    <a class="btn" href="ClienteServlet?accion=editar&id=<%=c.getId()%>">Editar</a>
                    <a class="btn btn-danger" href="ClienteServlet?accion=eliminar&id=<%=c.getId()%>">Eliminar</a>
                </td>
            </tr>

    <% }} %>

</table>

<br>
<a href="panel.jsp">⬅ Volver al Panel</a>

</body>
</html>
