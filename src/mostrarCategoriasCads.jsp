<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.unicid.bean.Categoria" %>

<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1" %>

<html>
<head>
<title>Lista Categorias</title>
</head>
<body>
	<center>
		<table width="100%" border="1" cellpadding="2" cellspacing="0">
			<tr>
				<th colspan="6"><h3>Lista de Categorias</h3></th>
			</tr>
			<tr>
				<th>Nome</th>
				<th>Código - Atualizar</th>
				<th>Linha</th>
				<th>Faixa Etária</th>
			</tr>
				<%
					List<Categoria> lista = new ArrayList<Categoria>();
					lista = (ArrayList) request.getAttribute("categoriasList");
					for(Categoria c: lista ){%>
				<tr>
						<td><center><%=c.getNome()%></center></td>
						<td><center><%=c.getCod()%></center></td>
						<td><center><%=c.getLinha()%></center></td>
						<td><center><%=c.getFaixaEtaria()%></center></td>
				</tr>
				<%
					}			
			%>
			<tr>
				<td colspan="6" align="center"><a href="cadastroCategorias.jsp">Página Inicial de Categorias</a></td>
			</tr>
		</table>
	</center>
</body>
<style>
	 body {
    		background-color: lightgray;
    		font-family: Arial, Helvetica, sans-serif;
  		}
</style>
</html>