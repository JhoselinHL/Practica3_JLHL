

<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Inscrito"%>
<%
    ArrayList<Inscrito> lista = (ArrayList<Inscrito>) session.getAttribute("listaP");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registro de Seminarios</title>
    <link rel="stylesheet" href="estilo.css">
</head>
<body>

<h1 style="text-align: center">Listado de inscritos</h1>
<table align="CENTER" border="1" cellspacing="0">
    <button align="CENTER"><a href="MainServlet?op=nuevo">NUEVO</a></button> 
    <tr>
        <th>ID</th>
        <th>FECHA</th>
        <th>NOMBRE</th>
        <th>APELLIDOS</th>
        <th>TURNO</th>
        <th>SEMINARIOS</th>
        <th></th>
    </tr>
    <%
        if(lista != null){
            for(Inscrito item : lista){
    %>
    <tr>
        <td><%= item.getId()%></td>
        <td><%= item.getFecha()%></td>
        <td><%= item.getNombre()%></td>
        <td><%= item.getApellidos()%></td>
        <td><%= item.getTurno()%></td>
        <td>
            <%
                String[] seminarios = item.getSeminarios();
                if (seminarios != null && seminarios.length > 0) {
                    for (String seminario : seminarios) {
                        out.println(seminario + "<br>");
                    }
                } else {
                    out.println("No hay seminarios seleccionados");
                }
            %>
        </td>
        <td><a href="MainServlet?op=editar&id=<%= item.getId()%>">Editar</a></td>
        <td><a href="MainServlet?op=eliminar&id=<%= item.getId()%>"
               onclick='return confirm("¿Está seguro/a de eliminar el registro?");'>Eliminar</a></td>
    </tr>
    <%
            }
        }
    %>
</table>
</body>
</html>
