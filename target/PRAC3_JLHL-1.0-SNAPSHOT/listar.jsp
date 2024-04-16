<%-- 
--%>
<%@page import="com.emergentes.modelo.Inscrito"%>
<%@page import="java.util.Date"%>
<%@ page import="java.util.Arrays" %>
<%
    Inscrito item = (Inscrito) request.getAttribute("nuevapersona");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Editar</title>
    <style>
        /* Estilos para las tablas */
        .tabla {
            border: 1px solid black;
            border-collapse: collapse;
            margin-right: 30px; 
            float: left; 
        }
    </style>
</head>
<body>
<h1 style="text-align: center"><%= (item.getId() == 0) ? "Registro en Seminarios" : "Editar"%></h1>
<!-- Formulario para enviar ambos conjuntos de datos -->
<form action="MainServlet" method="post">
    <!-- Campo oculto para enviar el ID de la persona -->
    <input type="hidden" name="id" value="<%= (item != null) ? item.getId() : "" %>"/>

    <!-- Tabla para la información personal -->
    <table class="tabla">
        <tr>
            <td>
                <fieldset>
                    <legend>Datos Personales</legend>
                    <table>
                        <tr>
                            <td>FECHA:</td>
                            <td><input type="date" name="fecha" value="<%= (item != null && item.getFecha() != null) ? item.getFecha() : ""%>"/></td>
                        </tr>
                        <tr>
                            <td>NOMBRE</td>
                            <td><input type="text" name="nombre"  value="<%= (item != null && item.getNombre() != null) ? item.getNombre() : ""%>"/></td>
                        </tr>
                        <tr>
                            <td>APELLIDOS</td>
                            <td><input type="text" name="apellidos"  value="<%= (item != null && item.getApellidos() != null) ? item.getApellidos() : ""%>"/></td>
                        </tr>
                        <tr>
                            <td>TURNO:</td>
                            <td>
                                <input type="radio" id="manana" name="turno" value="Manana" <%= (item != null && item.getTurno() != null && item.getTurno().equals("Manana")) ? "checked" : ""%>>
                                <label for="manana">Mañana</label>
                                <input type="radio" id="tarde" name="turno" value="Tarde" <%= (item != null && item.getTurno() != null && item.getTurno().equals("Tarde")) ? "checked" : ""%>>
                                <label for="tarde">Tarde</label>
                                <input type="radio" id="noche" name="turno" value="Noche" <%= (item != null && item.getTurno() != null && item.getTurno().equals("Noche")) ? "checked" : ""%>>
                                <label for="noche">Noche</label>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>

    <!-- Tabla para los seminarios -->
    <table class="tabla">
        <tr>
            <td>
                <fieldset>
                    <legend>Seminarios Disponibles</legend>
                    <table>
                        <tr>
                            <td>
                                <input type="checkbox" id="ia" name="seminarios" value="Inteligencia Artificial" <%= (item != null && item.getSeminarios() != null && Arrays.asList(item.getSeminarios()).contains("Inteligencia Artificial")) ? "checked" : ""%>>
                                <label for="ia">Inteligencia Artificial</label><br>
                                <input type="checkbox" id="maquina" name="seminarios" value="Machine learning" <%= (item != null && item.getSeminarios() != null && Arrays.asList(item.getSeminarios()).contains("Machine learning")) ? "checked" : ""%>>
                                <label for="maquina">Machine learning</label><br>
                                <input type="checkbox" id="simulacion" name="seminarios" value="Simulacion con arena" <%= (item != null && item.getSeminarios() != null && Arrays.asList(item.getSeminarios()).contains("Simulacion con arena")) ? "checked" : ""%>>
                                <label for="simulacion">Simulacion con arena</label><br>
                                <input type="checkbox" id="robotica" name="seminarios" value="Robotica Educativa" <%= (item != null && item.getSeminarios() != null && Arrays.asList(item.getSeminarios()).contains("Robotica Educativa")) ? "checked" : ""%>>
                                <label for="robotica">Robotica Educativa</label><br>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </td>
        </tr>
    </table>

    <!-- Boton para enviar ambos conjuntos de datos -->
    <input type="submit" value="Enviar Registro"/>
</form>

</body>
</html>
