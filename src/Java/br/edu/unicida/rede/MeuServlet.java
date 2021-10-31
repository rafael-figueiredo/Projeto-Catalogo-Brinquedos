package br.edu.unicid.web;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/teste")
public class MeuServlet extends HttpServlet {
	
	protected void service(HttpServletRequest req, HttpServletResponse rep) throws IOException {
		
		PrintWriter out = rep.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("Meu segundo Servlet so que agora com o parametro de url de teste");
		out.println("</body>");
		out.println("</html>");
				
	}

}
