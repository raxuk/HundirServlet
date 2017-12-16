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
					String l = "A";
					while (l != "I") {
						out.println("<th>" + l + "</th>");
						l += 1;
					}
				%>
			</tr>
			<%
				for (int i = 0; i < 8; i++) {
					out.println("<tr>");
					out.println("<td>" + (i + 1) + "</td>");
					for (int j = 0; j < 8; j++) {
						String color;
						int casilla = partida.getCasilla(i, j);
						if(casilla==partida.AGUA){
							color = "blue";
						}
					}
				}
			%>
			<tr>
				<td>1</td>
				<td bgcolor="blue"><input type="radio" name="tocar" value="1#A"></td>
				<td><input type="radio" name="tocar" value="1#B"></td>
				<td><input type="radio" name="tocar" value="1#C"></td>
				<td><input type="radio" name="tocar" value="1#D"></td>
				<td><input type="radio" name="tocar" value="1#E"></td>
				<td><input type="radio" name="tocar" value="1#F"></td>
				<td><input type="radio" name="tocar" value="1#G"></td>
				<td><input type="radio" name="tocar" value="1#H"></td>
			</tr>
			<tr>
				<td>2</td>
				<td><input type="radio" name="tocar" value="1#A"></td>
				<td><input type="radio" name="tocar" value="1#B"></td>
				<td><input type="radio" name="tocar" value="1#C"></td>
				<td><input type="radio" name="tocar" value="1#D"></td>
				<td><input type="radio" name="tocar" value="1#E"></td>
				<td><input type="radio" name="tocar" value="1#F"></td>
				<td><input type="radio" name="tocar" value="1#G"></td>
				<td><input type="radio" name="tocar" value="1#H"></td>
			</tr>
			<tr>
				<td>3</td>
				<td><input type="radio" name="tocar" value="1#A"></td>
				<td><input type="radio" name="tocar" value="1#B"></td>
				<td><input type="radio" name="tocar" value="1#C"></td>
				<td><input type="radio" name="tocar" value="1#D"></td>
				<td><input type="radio" name="tocar" value="1#E"></td>
				<td><input type="radio" name="tocar" value="1#F"></td>
				<td><input type="radio" name="tocar" value="1#G"></td>
				<td><input type="radio" name="tocar" value="1#H"></td>
			</tr>
			<tr>
				<td>4</td>
				<td><input type="radio" name="tocar" value="1#A"></td>
				<td><input type="radio" name="tocar" value="1#B"></td>
				<td><input type="radio" name="tocar" value="1#C"></td>
				<td><input type="radio" name="tocar" value="1#D"></td>
				<td><input type="radio" name="tocar" value="1#E"></td>
				<td><input type="radio" name="tocar" value="1#F"></td>
				<td><input type="radio" name="tocar" value="1#G"></td>
				<td><input type="radio" name="tocar" value="1#H"></td>
			</tr>
			<tr>
				<td>5</td>
				<td><input type="radio" name="tocar" value="1#A"></td>
				<td><input type="radio" name="tocar" value="1#B"></td>
				<td><input type="radio" name="tocar" value="1#C"></td>
				<td><input type="radio" name="tocar" value="1#D"></td>
				<td><input type="radio" name="tocar" value="1#E"></td>
				<td><input type="radio" name="tocar" value="1#F"></td>
				<td><input type="radio" name="tocar" value="1#G"></td>
				<td><input type="radio" name="tocar" value="1#H"></td>
			</tr>
			<tr>
				<td>6</td>
				<td><input type="radio" name="tocar" value="1#A"></td>
				<td><input type="radio" name="tocar" value="1#B"></td>
				<td><input type="radio" name="tocar" value="1#C"></td>
				<td><input type="radio" name="tocar" value="1#D"></td>
				<td><input type="radio" name="tocar" value="1#E"></td>
				<td><input type="radio" name="tocar" value="1#F"></td>
				<td><input type="radio" name="tocar" value="1#G"></td>
				<td><input type="radio" name="tocar" value="1#H"></td>
			</tr>
			<tr>
				<td>7</td>
				<td><input type="radio" name="tocar" value="1#A"></td>
				<td><input type="radio" name="tocar" value="1#B"></td>
				<td><input type="radio" name="tocar" value="1#C"></td>
				<td><input type="radio" name="tocar" value="1#D"></td>
				<td><input type="radio" name="tocar" value="1#E"></td>
				<td><input type="radio" name="tocar" value="1#F"></td>
				<td><input type="radio" name="tocar" value="1#G"></td>
				<td><input type="radio" name="tocar" value="1#H"></td>
			</tr>
			<tr>
				<td>8</td>
				<td><input type="radio" name="tocar" value="1#A"></td>
				<td><input type="radio" name="tocar" value="1#B"></td>
				<td><input type="radio" name="tocar" value="1#C"></td>
				<td><input type="radio" name="tocar" value="1#D"></td>
				<td><input type="radio" name="tocar" value="1#E"></td>
				<td><input type="radio" name="tocar" value="1#F"></td>
				<td><input type="radio" name="tocar" value="1#G"></td>
				<td><input type="radio" name="tocar" value="1#H"></td>
			</tr>
		</table>
		<table>
			<tr>
				<td><input type="submit" value="Enviar"></td>
			</tr>
		</table>
	</form>
	<p>
		<a href="./formulario.html"> Muestra Solución</a>
	<p>
		<a href="./formulario.html"> Nueva Partida</a>
	<p>
		<a href="./formulario.html"> Salir</a>
</body>
</html>