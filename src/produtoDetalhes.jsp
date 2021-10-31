<%@ page import="br.edu.unicid.bean.*, br.edu.unicid.web.*" %>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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

 <!-- navegação -->
  <header>
    <nav class="navbar navbar-light navbar-transparent fixed-top shadow">
      <div class="container-fluid">
        <span>
          <button class="navbar-toggler" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">
            <span class="navbar-toggler-icon"></span></button>
          <span class="navbar-brand mb-0 h1"> <a class="navbar-brand" href="index.jsp"><img src="imgs/logo1.png"
                width="65" alt="logo"></a></span></span>
      </div>
    </nav>

    <!--  menu -->
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
    <div class="container align-self-center col shadow  bg-body rounded ">
	    <div class="card mb-3" >
	      <%
	            String id = request.getParameter("id");
	       		Produto produto = new ServletProduto().procurarProduto(Integer.parseInt(id));
	         %>
	    
	         
		  <div class="row g-0">
		    <div class="col-md-4">
		      <img src="imgs/<%=produto.getCod()%>.png" class="img-fluid rounded-start" alt="<%=produto.getProduto()%>">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
			        <h5 class="card-title"><%=produto.getProduto()%></h5>
			        <p class="card-text"><b>Cod: </b><%=produto.getCod()%></p>
			        <p class="card-text"><b>Produto: </b><%=produto.getProduto()%></p>
			        <p class="card-text"><b>Preço: </b><%=produto.getPrecoFormatBr()%></p>
			        <p class="card-text"><b>Categoria: </b><%=produto.getCategoria()%></p>
			        <p class="card-text"><b>Descrição: </b><%=produto.getDescricao()%></p>			
		      </div>
		      
		      <div class="d-grid gap-2 col-2 mx-auto">
  				<a class="btn btn-warning" href="index.jsp" role="button">Voltar</a>
				</div>	
		    </div>
		  </div>
		</div>
	</div>
  </section>
  

</body>
</html>
<style>
html,
body,
#home {
  height: 100%;
}

body {
  background: #f9f9f9;
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

a:link {
  font-size: 1em;
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
  text-decoration: underline;
}
a:active {
  color: yellow;
  background-color: transparent;
  text-decoration: underline;
}

.row-cols-md-3 > * {
  flex: 0 0 auto;
  width: 31%;
  margin: 15px;
}


/*tipografia*/
h1 {
  font-weight: 900;
  text-shadow: 0.1em 0.05em 0.1em rgb(240, 238, 238);
  letter-spacing: -0.05em;
  margin-bottom: 50px;
  color: #d9415d;
}

.card-title {
    margin-bottom: 0.6rem;
    color: rgb(2 0 108);
    font-size: 1.58rem;
    background: skyblue;
    text-align: center;
}

.card {
    position: relative;
    display: flex;
    flex-direction: column;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    margin: 10px;
    border:none;
}

.card-body {
    margin: 10px;
}

.card-text {
   font-size: 1.2rem;
   color: #084298;
}


</style>