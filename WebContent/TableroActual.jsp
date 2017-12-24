<%@page import="modelo.Partida"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>
body {
	width: 80%;
	margin-left: auto;
	margin-right: auto;
}

h1 {
	color: black;
	font-size: 30px;
	text-align: center;
}
</style>
<title>Hundir la flota</title>
<body>
	<h1>Hundir la flota</h1>

	<%
		HttpSession sesion = request.getSession();
		Partida partida = (Partida) sesion.getAttribute("Partida");
		if (partida.getDisparos() == 0) {
			out.println("<p>NUEVA PARTIDA</p>");
		} else {
			out.println("HOLI");
		}
		out.println("<p>Barcos Navegando: " + partida.getBarcosQuedan() + "  Barcos Hundidos: "
				+ (partida.getBarcosInicial() - partida.getBarcosQuedan()) + "</p>");
		out.println("Numero de disparos efectuados: " + partida.getDisparos());
	%>

	<form action="HundirFlotaServlet" method="get">
		<table>
			<tr>
				<th></th>
				<%
					char l = 'A';
					while (l != 'I') {
						out.println("<th>" + l + "</th>");
						l++;
					}
				%>
			</tr>
			<%
				for (int i = 0; i < partida.getnumFilas(); i++) {
					out.println("<tr>");
					out.println("<td>" + (i + 1) + "</td>");
					for (int j = 0; j < partida.getNumCol(); j++) {
						String color;
						int casilla = partida.getCasilla(i, j);
						if(casilla==partida.AGUA && partida.casillaDisparada(i, j))
							color = "blue";
						else 
							if(casilla==partida.HUNDIDO && partida.casillaDisparada(i, j))
							color = "red";
							else
								if(casilla==partida.TOCADO && partida.casillaDisparada(i, j))
									color = "orange";
								else
									color = "white";
						//
						out.println("<td bgcolor=\""+color+"\"><input type =\"radio\" name=\"boton\" value=\""+i+"#"+j+"\"></td>");		
					}
					out.println("<\tr>");
				}
			%>
		</table>
		<table>
			<tr>
				<td><input type="submit" value="Enviar"></td>
			</tr>
		</table>
	</form>
	<p>
		<a href="SolucionPartidaServlet"> Muestra Solución</a>
	<p>
		<a href="NuevaPartidaServlet"> Nueva Partida</a>
	<p>
		<a href="SalirPartidaServlet"> Salir</a>
</body>
</html>