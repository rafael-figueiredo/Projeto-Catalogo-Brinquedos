package br.edu.unicid.web;

import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.util.List;

import br.edu.unicid.bean.Produto;
import br.edu.unicid.dao.ProdutoDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/ServletProdutos")
public class ServletProdutos extends HttpServlet {

	    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
	    throws ServletException, IOException {
	        response.setContentType("text/html;charset=UTF-8");
	        // a vari�vel cmd indica o tipo de a��o - incluir, alterar, consulta.....
	        String cmd = request.getParameter("cmd");
	        // cria um objeto dao - CRUD
	        ProdutoDao dao;
	        // cria um objeto do tipo aluno
	        Produto produto = new Produto();
	        if (cmd != null) {
	            try {
	                // inicializa os atributos da classe Categoria
	            	produto.setCod(Integer.parseInt(request.getParameter("txtCod"))); 
	            	produto.setProduto(request.getParameter("txtProdu")); 
	                produto.setPreco(Double.parseDouble(request.getParameter("txtPreco")));
	                produto.setCategoria(request.getParameter("txtCategoria"));
	                produto.setDescricao(request.getParameter("txtDescri"));
                } catch (Exception ex) {
	                ex.printStackTrace();
	            }
	        }
	        try {
	        	// cria a instancia do objeto dao
	            dao = new ProdutoDao();
	            RequestDispatcher rd = null;
	            // lista todos os produtos
	            if (cmd.equalsIgnoreCase("listar")) {
	                List produtosList = dao.todosProdutos();
	                // cria uma sess�o para encaminhar a lista para uma JSP
	                request.setAttribute("produtosList", produtosList);
	                // redireciona para a JSP mostraProdutosCads
	                rd = request.getRequestDispatcher("/mostrarProdutosCads.jsp");
	            }
	            
	            // incluir produto
	            else if (cmd.equalsIgnoreCase("incluir")) {
	                dao.salvar(produto);
	                rd = request.getRequestDispatcher("ServletProdutos?cmd=listar");
	             
	            // consulta produto para exclus�o    
	            } else if (cmd.equalsIgnoreCase("exc")) {
	                produto = dao.procurarProduto(produto.getCod());
	                HttpSession session = request.getSession(true);
	                session.setAttribute("produto", produto);
	                rd = request.getRequestDispatcher("/formExcProduto.jsp");
	             
	            // exclui produto
	            } else if (cmd.equalsIgnoreCase("excluir")) {
	                dao.excluir(produto);
	                rd = request.getRequestDispatcher("ServletProdutos?cmd=listar");
	            
	            // consulta produto para altera��o
	            }  else if (cmd.equalsIgnoreCase("atu")) {
	                produto = dao.procurarProduto(produto.getCod());
	                HttpSession session = request.getSession(true);
	                session.setAttribute("produto", produto);
	                rd = request.getRequestDispatcher("/formAtuProduto.jsp");
	             
	            // consulta produto
	            } else if (cmd.equalsIgnoreCase("con")) {
	                produto = dao.procurarProduto(produto.getCod());
	                HttpSession session = request.getSession(true);
	                session.setAttribute("produto", produto);
	                rd = request.getRequestDispatcher("/formConProduto.jsp");
	            
	             // altera produto    
	            } else if (cmd.equalsIgnoreCase("atualizar")) {
	                dao.atualizar(produto);
	                rd = request.getRequestDispatcher("ServletProdutos?cmd=listar");
	            
	            // direciona para a p�gina principal
	            } else if (cmd.equalsIgnoreCase("principal")) {
	                rd = request.getRequestDispatcher("/index.jsp");
	            }            
	            // executa a a��o de direcionar para a p�gina JSP
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