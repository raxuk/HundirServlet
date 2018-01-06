package controlador;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Partida;

/**
 * Servlet implementation class NuevaPartidaServlet
 */
public class NuevaPartidaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public NuevaPartidaServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession sesion = request.getSession();
		Partida partida = (Partida) sesion.getAttribute("Partida");
		partida = new Partida(partida.getnumFilas(), partida.getNumCol(), partida.getBarcosInicial());
		sesion.setAttribute("Partida", partida);

		RequestDispatcher vista = request.getRequestDispatcher("HundirFlotaServlet");
		vista.forward(request, response);

		/*
		 * Habiamos usado sendRedirect al principio, cual es la diferencia entre este y
		 * RequestDispatcher?
		 */
		// response.sendRedirect("HundirFlotaServlet");

	}
}
