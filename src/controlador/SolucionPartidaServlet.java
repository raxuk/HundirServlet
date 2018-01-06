package controlador;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Partida;

/**
 * Servlet implementation class SolucionPartidaServlet
 */
public class SolucionPartidaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SolucionPartidaServlet() {
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
		String[] solucionOriginal = partida.getSolucion();
		List<String> solucion = new ArrayList<String>();
		//
		for (String barco : solucionOriginal) {
			String[] partes = barco.split("#");
			int fInicial = Integer.parseInt(partes[0]);
			int cInicial = Integer.parseInt(partes[1]);
			String orientacion = partes[2];
			int tamayo = Integer.parseInt(partes[3]);
			//
			if (orientacion.equals("V"))
				for (int i = 0; i < tamayo; i++)
					solucion.add((fInicial + i) + "#" + cInicial);

			else
				for (int i = 0; i < tamayo; i++)
					solucion.add(fInicial + "#" + (cInicial + i));
		}
		//
		sesion.setAttribute("Solucion", solucion);

		RequestDispatcher vista = request.getRequestDispatcher("TableroSolucion.jsp");
		vista.forward(request, response);
	}

}
