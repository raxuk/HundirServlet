package controlador;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Partida;

/**
 * Servlet implementation class HundirFlotaServlet
 */
public class HundirFlotaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HundirFlotaServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Recupera objeto sesión o crea uno nuevo (true) | tambien se puede
		// poner como request.getSession(), sin especificar un boolean hace lo
		// mismo que si es true | si es false, devuelve null si no existe
		HttpSession sesion = request.getSession(false);
		Partida partida = null;
		if (sesion == null) {
			sesion = request.getSession();
			partida = new Partida(8, 8, 6);
			// sesion.setAttribute("Partida", partida);
		} else {
			partida = (Partida) sesion.getAttribute("Partida");
		}
		// conseguir posición del boton
		String posicion = request.getParameter("boton");
		if (posicion != null) {
			String[] coor = posicion.split("#");
			if (!(partida.casillaDisparada(Integer.parseInt(coor[0]), Integer.parseInt(coor[1])))) {
				String estado = "ok!";
				int casilla = partida.pruebaCasilla(Integer.parseInt(coor[0]), Integer.parseInt(coor[1]));
				if (casilla == Partida.AGUA)
					estado = "Agua";
				if (casilla == Partida.TOCADO)
					estado = "Tocado";
				if (casilla >= 0)
					estado = "Hundido";
				sesion.setAttribute("estado", estado);
			} else
				sesion.setAttribute("estado", "Casilla ya disparada");

			sesion.setAttribute("disparo", (Integer.parseInt(coor[0]) + 1) + "#"
					+ Character.toString((char) (Integer.parseInt(coor[1]) + 65)));
		}

		// Guardar partida en la sesión
		sesion.setAttribute("Partida", partida);
		// Redirigir la ejecucion al fichero JSP que construira la Vista
		response.sendRedirect("TableroActual.jsp");
	}

}
