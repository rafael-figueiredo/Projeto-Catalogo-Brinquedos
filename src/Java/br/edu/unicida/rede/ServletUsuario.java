package br.edu.unicid.web;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.List;

import br.edu.unicid.bean.Usuario;
import br.edu.unicid.dao.UsuarioDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ServletUsuario")
public class ServletUsuario extends HttpServlet {

	    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");
	        // a variável cmd indica o tipo de ação - incluir, alterar, consulta.....
	        String cmd = request.getParameter("cmd");
	        // cria um objeto dao - CRUD
	        UsuarioDao dao;
	        // cria um objeto do tipo usuario
	        Usuario usuario = new Usuario();
	        if (cmd != null) {
	            try {
	                // inicializa os atributos da classe Categoria
	            	usuario.setCod(Integer.parseInt(request.getParameter("txtCod"))); 
	            	usuario.setNome(request.getParameter("txtNome")); 
	                usuario.setIdade(Integer.parseInt(request.getParameter("txtIdade")));
	                usuario.setUsuario(request.getParameter("txtUsuario"));
	                usuario.setSenha(request.getParameter("txtSenha"));
                } catch (Exception ex) {
	                ex.printStackTrace();
	            }
	        }
	        try {
	        	// cria a instancia do objeto dao
	            dao = new UsuarioDao();
	            RequestDispatcher rd = null;
	            // lista todos os usuarios
	            if (cmd.equalsIgnoreCase("listar")) {
	                List usuarioList = dao.todosUsuarios();
	                // cria uma sessão para encaminhar a lista para uma JSP
	                request.setAttribute("usuarioList", usuarioList);
	                // redireciona para a JSP mostraUsuarioCads
	                rd = request.getRequestDispatcher("/mostrarUsuariosCads.jsp");
	            }
	            
	            // incluir usuario
	            else if (cmd.equalsIgnoreCase("incluir")) {
	                dao.salvar(usuario);
	                rd = request.getRequestDispatcher("ServletUsuario?cmd=listar");
	             
	            // consulta usuario para exclusão    
	            } else if (cmd.equalsIgnoreCase("exc")) {
	                usuario = dao.procurarUsuario(usuario.getCod());
	                HttpSession session = request.getSession(true);
	                session.setAttribute("usuario", usuario);
	                rd = request.getRequestDispatcher("/formExcUsuario.jsp");
	             
	            // exclui usuario
	            } else if (cmd.equalsIgnoreCase("excluir")) {
	                dao.excluir(usuario);
	                rd = request.getRequestDispatcher("ServletUsuario?cmd=listar");
	            
	            // consulta usuario para alteração
	            }  else if (cmd.equalsIgnoreCase("atu")) {
	                usuario = dao.procurarUsuario(usuario.getCod());
	                HttpSession session = request.getSession(true);
	                session.setAttribute("usuario", usuario);
	                rd = request.getRequestDispatcher("/formAtuUsuario.jsp");
	             
	            // consulta usuario
	            } else if (cmd.equalsIgnoreCase("con")) {
	                usuario = dao.procurarUsuario(usuario.getCod());
	                HttpSession session = request.getSession(true);
	                session.setAttribute("usuario", usuario);
	                rd = request.getRequestDispatcher("/formConUsuario.jsp");
	            
	             // altera usuario
	            } else if (cmd.equalsIgnoreCase("atualizar")) {
	                dao.atualizar(usuario);
	                rd = request.getRequestDispatcher("ServletUsuario?cmd=listar");
	            
	            // direciona para a página principal
	            } else if (cmd.equalsIgnoreCase("principal")) {
	                rd = request.getRequestDispatcher("/index.jsp");
	            }            
	            // executa a ação de direcionar para a página JSP
	            rd.forward(request, response);
	        } catch (Exception e) {
	            e.printStackTrace();
	            throw new ServletException(e);
	        }
	    } 

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	        processRequest(request, response);
	    } 

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	        processRequest(request, response);
	    }
}