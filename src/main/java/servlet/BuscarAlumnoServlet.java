package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Servlet
 */
@WebServlet("/BuscarAlumnoServlet")
public class BuscarAlumnoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BuscarAlumnoServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Holaaaax").append(request.getContextPath());

		String nombre = request.getParameter("nombre");
		String apellido = request.getParameter("apellido");
		String ci = request.getParameter("ci");

		Integer ciInt = null;
		if (ci != "") {
			ciInt = Integer.parseInt(ci);
		}
		
		BuscarAlumnos buscarAlumnos = new BuscarAlumnos();
		Alumno alumno = buscarAlumnos.buscarAlumno(nombre, apellido, ciInt);
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		writer.println("Hola " + alumno);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
