<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="servlet.Alumno"
	import="servlet.BuscarAlumnos"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alumno encontrado</title>
<link rel="stylesheet" type="text/css" href="styles.css">
<title>Insert title here</title>
</head>
<body>
	<%
	String nombre = request.getParameter("nombre");
	String apellido = request.getParameter("apellido");
	String ci = request.getParameter("ci");
	
	Integer ciInt = null;
	if (ci != "") {
		ciInt = Integer.parseInt(ci);
	}

	BuscarAlumnos buscarAlumnos = new BuscarAlumnos();
	
	Alumno alumno = buscarAlumnos.buscarAlumno(nombre , apellido, ciInt);
	if((alumno.getNombre() != null) || (alumno.getApellido()!= null) || (alumno.getCi() != null)){
	
	%>
	
	<div class="container">
        <div class="logo">
            <img src="logo_utec.jpg" alt="Logo UTEC">
        </div>
        <h1>Sistema de gestión de alumnos</h1>
        <h2>Selección de alumnos</h2> <!-- Nuevo título agregado -->
        <form action="" method="GET">

            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" 
            value = <% out.println(alumno.getNombre()); %>>

            <label for="apellido">Apellido:</label>
            <input type="text" id="apellido" name="apellido"
                 value = <% out.println(alumno.getApellido()); %>>

            <label for="ci">Cedula de identidad:</label>
            <input type="number" value = <% out.println(alumno.getCi()); %>>
                
            <label for="codigoCarrera">Codigo carrera:</label>
            <input type="text" value = <% out.println(alumno.getCodigoCarrera()); %>>
            
            <label for="direccion">Direccion:</label>
            <input type="text" value = <% out.println(alumno.getDireccion()); %>>
            
            <label for="anioNacimiento">Año de nacimiento:</label>
            <input type="number" value = <% out.println(alumno.getAnioNacimiento()); %>>    

            <label for="archivoFoto">Archivo Foto de Alumno:</label>
            <input type="text" value = <% out.println(alumno.getArchivoFoto()); %>>
        </form>
        <footer>
            <hr>
            <p>Unidad Curricular de Programación de Aplicaciones Web - UTEC - 2023</p>
        </footer>
        <% } else { %>

        <h1> No se encontró ningún alumno con esos datos</h1>
        
       	<button onclick="window.location.href='/WebApp_S1/index2.html'">Volver</button>

        
        <% } %>
    </div>
	
</body>

</html>