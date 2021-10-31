package br.edu.unicid.web;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.List;

import br.edu.unicid.bean.Categoria;
import br.edu.unicid.bean.Produto;
import br.edu.unicid.dao.CategoriaDao;
import br.edu.unicid.dao.ProdutoDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ServletCategorias")
public class ServletCategorias extends HttpServlet {

	    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");
	        // a variável cmd indica o tipo de ação - incluir, alterar, consulta.....
	        String cmd = request.getParameter("cmd");
	        // cria um objeto dao - CRUD
	        CategoriaDao dao;
	        // cria um objeto do tipo aluno
	        Categoria categoria = new Categoria();
	        if (cmd != null) {
	            try {
	                // inicializa os atributos da classe Categoria
	            	categoria.setCod(Integer.parseInt(request.getParameter("txtCod"))); 
	            	categoria.setNome(request.getParameter("txtNome")); 
	                categoria.setLinha(request.getParameter("txtLinha"));
	                categoria.setFaixaEtaria(request.getParameter("txtFaixaEtaria"));
                } catch (Exception ex) {
	                ex.printStackTrace();
	            }
	        }
	        try {
	        	// cria a instancia do objeto dao
	            dao = new CategoriaDao();
	            RequestDispatcher rd = null;
	            // lista todos as categorias
	            if (cmd.equalsIgnoreCase("listar")) {
	                List categoriasList = dao.todasCategorias();
	                // cria uma sessão para encaminhar a lista para uma JSP
	                request.setAttribute("categoriasList", categoriasList);
	                // redireciona para a JSP mostraAlunosCads
	                rd = request.getRequestDispatcher("/mostrarCategoriasCads.jsp");
	            }
	            
	            // incluir aluno
	            else if (cmd.equalsIgnoreCase("incluir")) {
	                dao.salvar(categoria);
	                rd = request.getRequestDispatcher("ServletCategorias?cmd=listar");
	             
	            // consulta aluno para exclusão    
	            } else if (cmd.equalsIgnoreCase("exc")) {
	                categoria = dao.procurarCategoria(categoria.getCod());
	                HttpSession session = request.getSession(true);
	                session.setAttribute("categoria", categoria);
	                rd = request.getRequestDispatcher("/formExcCategoria.jsp");
	             
	            // exclui aluno
	            } else if (cmd.equalsIgnoreCase("excluir")) {
	                dao.excluir(categoria);
	                rd = request.getRequestDispatcher("ServletCategorias?cmd=listar");
	            
	            // consulta aluno para alteração
	            }  else if (cmd.equalsIgnoreCase("atu")) {
	                categoria = dao.procurarCategoria(categoria.getCod());
	                HttpSession session = request.getSession(true);
	                session.setAttribute("categoria", categoria);
	                rd = request.getRequestDispatcher("/formAtuCategoria.jsp");
	             
	            // consulta aluno
	            } else if (cmd.equalsIgnoreCase("con")) {
	                categoria = dao.procurarCategoria(categoria.getCod());
	                HttpSession session = request.getSession(true);
	                session.setAttribute("categoria", categoria);
	                rd = request.getRequestDispatcher("/formConCategoria.jsp");
	            
	             // altera aluno    
	            } else if (cmd.equalsIgnoreCase("atualizar")) {
	                dao.atualizar(categoria);
	                rd = request.getRequestDispatcher("ServletCategorias?cmd=listar");
	            
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
	    
	    public List<Categoria> todasCartegorias() throws ServletException {
	    	try {
	    		
	    		// cria a instancia do objeto dao
	    		CategoriaDao dao = new CategoriaDao();					   
				List categorias = dao.todasCategorias();
				return categorias;
		          
	        } catch (Exception e) {
	            e.printStackTrace();
	            throw new ServletException(e);
	        }
	    }
}