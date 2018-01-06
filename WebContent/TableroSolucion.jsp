<%@page import="modelo.Partida"%>
<%@ page import="java.util.*"%>
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

table.center {
	width: 500px;
	text-align: center;
	font-weight: bold;
	align: center;
}
</style>
<title>Hundir la flota</title>
<body>
	<h1>Hundir la flota</h1>

	<%
		HttpSession sesion = request.getSession();
		Partida partida = (Partida) sesion.getAttribute("Partida");
		ArrayList<String> solucion = (ArrayList<String>) sesion.getAttribute("Solucion");
		boolean finPartida = false;
		String textoEstado = "Solucion PARTIDA";
	%>
	<p><%=textoEstado%></p>
	<p>
		Barcos Navegando:
		<%=partida.getBarcosQuedan()%>
		<br>Barcos Hundidos:
		<%=partida.getBarcosInicial() - partida.getBarcosQuedan()%>
		<br>Número de disparos efectuados:
		<%=partida.getDisparos()%></p>


	<form action="HundirFlotaServlet" method="get">
		<table class="center">
			<tr>
				<th></th>
				<%
					char l = 'A';
					while (l != 'I') {
				%>
				<th><%=l%></th>
				<%
					l++;
					}
				%>


			</tr>
			<%
				for (int i = 0; i < partida.getnumFilas(); i++) {
			%>
			<tr>
				<td><%=(i + 1)%></td>
				<%
					for (int j = 0; j < partida.getNumCol(); j++) {
							String color;
							color = "blue";
							String casilla = i + "#" + j;
							if (solucion.contains(casilla)) {
								color = "red";
								solucion.remove(casilla);
							}
				%>
				<td bgcolor="<%=color%>"></td>
				<%
					}
				%>
			</tr>
			<%
				}
			%>

		</table>

	</form>
	<p>
		<a href="NuevaPartidaServlet"> Nueva Partida</a>
	<p>
		<a href="SalirPartidaServlet"> Salir</a>
</body>
</html>