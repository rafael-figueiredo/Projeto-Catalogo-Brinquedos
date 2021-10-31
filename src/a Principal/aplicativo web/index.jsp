<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.unicid.bean.*, br.edu.unicid.web.*" %>
<%@page import="br.edu.unicid.util.*"%>
<%@ page language="java" contentType="text/html" import="java.sql.*" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>
   
     <title>Toys &#38 Cia</title>
  <link rel="icon" href="imgs/logo1.png">
</head>
<body>
		<%
            ConnectionFactory conn = new ConnectionFactory();
			Connection conexao = conn.getConnection();
        %>
 <!-- navegação -->
  <header>
    <nav class="navbar navbar-light navbar-transparent fixed-top shadow">
      <div class="container-fluid">
        <span>
          <button class="navbar-toggler" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">
            <span class="navbar-toggler-icon"></span>
           </button>
          <span class="navbar-brand mb-0 h1"> <a class="navbar-brand" href="index.jsp"><img src="imgs/logo1.png"
                width="65" alt="logo"></a></span></span>
           <!-- Login -->     
        <button class="navbar-toggler" 
		        type="button" 
		        data-bs-toggle="offcanvas" 
		        data-bs-target="#offcanvasNavbar" 
		        aria-controls="offcanvasNavbar">
      		<span><img src="imgs/login.png" width="45" alt="logo"></span>
    	</button>
	    <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
	      <div class="offcanvas-header">
	        <h5 class="offcanvas-title" id="offcanvasNavbarLabel">Área Administrativa</h5>
	        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas" aria-label="Close"></button>
	      </div>
	      <div class="offcanvas-body">
	        	<form>
	  		<div class="mb-3">
	    	<label for="exampleInputEmail1" class="form-label">Login</label>
	    	<input type="email" class="form-control" id="exampleInputEmail1" name="usuario" aria-describedby="emailHelp">
	    	
	  		</div>
	  		<div class="mb-3">
	   		 <label for="exampleInputPassword1" class="form-label">Senha</label>
	   		 <input type="password" class="form-control" id="exampleInputPassword1" name="senha">
	  		</div>
	  		
	  		
	  		<%
	  		
                if (conexao !=null) {
                   if ((request.getParameter("usuario") !=null) && (request.getParameter("senha") !=null)) {
                       String login, pass;
                       login = request.getParameter("usuario");
                       pass = request.getParameter("senha");
                       Statement st;
                       ResultSet rs;
                       st = conexao.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.TYPE_FORWARD_ONLY);
                       rs = st.executeQuery("SELECT * FROM usuario WHERE usuario ='"+login+"' AND senha='"+pass+"'");
                       if(rs.next()){
                         response.sendRedirect("areaAdministrativa.jsp");
                       }else{                    	  
                    	   response.sendRedirect("incorreto.jsp");
                       }
                     }
                }else {
                		out.print("Erro ao Conectar!");
                }
            %>
	  		<input type="submit" name="btnLog" id="btnLog" class="btn btn-primary btn-block" value="Logar">
	  		<a href="incluirUsuario.jsp"><input type="button" class="btn btn-primary" value="Novo Usuário"></a>
	  		
			</form>
	      </div>
	   	</div>
      </div>      
    </nav>   
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">MENU</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <ul class="list-group list-group-flushn">
            <%
				List<Categoria> categorias = new ServletCategorias().todasCartegorias();
				for(Categoria catergoria: categorias ) 
			{%>
            	<li class="list-group-item" >
            		<a href="cartegorias.jsp?id=<%=catergoria.getCod()%>" class="two"><%=catergoria.getNome()%></a>
            	</li>
 			<%}%>
          </ul>
        </div>
      </div>
    </div>
  </header>
  <section id="home" class="d-flex">
    <div class="container align-self-center">
      <div class="row">
        <div class="col-md-12 capa">
          <h1>Catálogo de Brinquedos</h1>
        </div>
      </div>
    </div>
  </section>
 	
 	<!--  galeria -->
  <section id="servicos">

    <div class="row row-cols-1 row-cols-md-3 g-3 ">
		<%
			List<Produto> lista = new ServletProduto().todosProdutos();
			for(Produto produto: lista ) 
		{%>

	      <div class="col shadow p-3 mb-5 bg-body rounded card mb-3 ">
	        <div class="card">
	          <img src="imgs/<%=produto.getCod()%>.png" alt="carro amarelo de brinquedo">
				
	          <div class="card-body">
	          <a href="produtoDetalhes.jsp?id=<%=produto.getCod()%>">          
	            <h3 class="card-title">Cod:<%=produto.getCod()%></h3><br>
	            <p class="card-text"><b><%=produto.getProduto()%></b></p>
	            <p class="card-text-preco"><b><%=produto.getPrecoFormatBr()%> á vista</b></p>
	           <button class="btn btn-primary" type="submit">+ Detalhes</button></a>                          
	          </div>
	        </div>
	      </div>
      
      	 <%}%>
     
    </div>
  </section>  
  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-2">
          <img src="imgs/Logo.png" width="60" alt="lodo da toys &#38 cia ">
        </div>
        <div class="col-md-2">
          <h4>Institucional</h4>
          <ul class="navbar-nav">
            <li><a href="">Sobre a Toys &#38 cia</a></li>
            <li><a href="">Assesoria de Imprensa</a></li>
            <li><a href="">Nossa Lojas</a></li>
          </ul>
        </div>
        <div class="col-md-2">
          <h4>Serviços</h4>
          <ul class="navbar-nav">
            <li><a href="">Lista de aniversário</a></li>
            <li><a href="">Consulta Toys vale</a></li>
            <li><a href="">Campanhas promocionais</a></li>

          </ul>
        </div>
        <div class="col-md-2">
          <h4>Atendimento</h4>
          <ul class="navbar-nav">
            <li><a href="">Central de atendimento</a></li>
            <li><a href="">Políticas de frete</a></li>
            <li><a href="">Trocas e devoluções</a></li>

          </ul>
        </div>
        <div class="col-md-4">
          <ul>
            <li>
              <a href=""><img src="imgs/facebook (1).png" width="40" alt="facebook"></a>
            </li>
            <li>
              <a href=""><img src="imgs/whatsapp.png" width="40" alt="whatsapp"></a>
            </li>
            <li>
              <a href=""><img src="imgs/instagram.png" width="40" alt="instagram"></a>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </footer>
</body>
</html>
<style>
@charset "ISO-8859-1";
html,
body,
#home {
  height: 95%;
}

body {
  background: url(imgs/fundomenino.jpg)center;
  font-family: Arial, Helvetica, sans-serif;
}

/*barra de navegação */
nav.navbar-transparent {
  background: rgba(46, 234, 247, 0.719) no-repeat;
  height: 80px;
}

.modal {
  width: 300px;
}

.modal-header{
  background: #7a7efdb8;
  color: white;
  
}

.modal-content {
  width: 300px;
  
}

.list-group-item:hover {
  background-color: rgba(46, 234, 247, 0.219) !important;
}

.navbar-toggler {
  margin-right: 20px;
}

.nav-link:focus,
.nav-link {
  color: #0d0259;
}

.nav-link:focus,
.nav-link:hover {
  color: #f20587;
}

.navbar-light .navbar-toggler {
  color: rgba(255, 255, 255, 0.336);
  border-color: rgba(255, 255, 255, 0.068);
}

#login {
	margin:10px;
	padding: 10px;
}

/*capa */
.capa {
  text-align: center;
}

.card {
 
  text-align: center;
}

.card-text{
  font-size: 1.5rem;
  color: #dc35b8;
}
.card-text-preco  {
  font-size: 1.6rem;
  color:  #ff6a00;
}
.card-body {

    background: #f3f700;
}

a:link {
  font-size: 1.5em;
  text-align: center;
  color: green;
  background-color: transparent;
  text-decoration: none;
}
a:visited {
  color: rgb(252, 5, 190);
  background-color: transparent;
  text-decoration: none;
}
a:hover {
  color: rgb(255, 81, 0);
  background-color: transparent;
 
}
a:active {
  color: yellow;
  background-color: transparent;
  text-decoration: underline;
}

a.two:hover {
  color: #f3ab10;
}

a.two:link {
  color: rgb(22 173 189);
  font-size: 1em;
  background-color: transparent;
  text-decoration: none;
  transition: 0.3s;
}
a.two:visited {
  color: rgb(211, 35, 255);
  background-color: transparent;
  text-decoration: none;
}

.row-cols-md-3 > * {
  flex: 0 0 auto;
  width: 31%;
  margin: 15px;
}

#servicos {
  background: #ffffff;
  padding: 25px;
  padding-bottom: 20px;
}

#servicos h3 {
  color: #7c25f8;
  font-weight: bold;
  text-align: center;
}

/*tipografia*/
h1 {
  font-weight: 900;
  letter-spacing: -0.05em;
  margin-bottom: 50px;
  color: #f14595;
}

.offcanvas-end {
    width: 250px;
}

/*rodape*/
footer {
  background: #f9f9f9;
  padding: 50px 0px 20px 0px;
  position: relative;
}

footer ul {
  list-style: none;
}

footer ul li {
  list-style: none;
  float: right;
  margin: 0 5px;
}

footer .navbar-nav a {
  color: #b63cfd;
  font-size: 0.8em;
}

footer .navbar-nav a:hover {
  color: #fc22df;
  text-decoration: none;
}

footer h4 {
  color: #9b05ff;
  font-size: 0.8em;
  text-transform: uppercase;
}

/*responsividade da tipografia da capa */

/* // Small devices (landscape phones, 576px and up) */
@media (min-width: 576px) {
}

/* // Medium devices (tablets, 768px and up) */
@media (min-width: 768px) {
  h1 {
    font-size: 3em;
  }
}

/* // Large devices (desktops, 992px and up) */
@media (min-width: 992px) {
  h1 {
    font-size: 4em;
  }
}

/* // X-Large devices (large desktops, 1200px and up) */
@media (min-width: 1200px) {
  h1 {
    font-size: 3.6em;
  }
}

/* // XX-Large devices (larger desktops, 1400px and up) */
@media (min-width: 1400px) {
  h1 {
    font-size: 6em;
  }
}


</style>