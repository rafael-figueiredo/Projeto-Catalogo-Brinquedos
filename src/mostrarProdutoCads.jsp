<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.unicid.bean.Produto" %>

<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1" %>

<html>
<head>
<title>Lista Produtos</title>
</head>
<body>
	<center>
		<table width="100%" border="1" cellpadding="2" cellspacing="0">
			<tr>
				<th colspan="6"><h3>Lista de Produtos</h3></th>
			</tr>
			<tr>
				<th>Código - Atualizar</th>
				<th>Produto</th>
				<th>Preço</th>
				<th>Categoria</th>
				<th>Descrição</th>
			</tr>
				<%
					List<Produto> lista = new ArrayList<Produto>();
					lista = (ArrayList) request.getAttribute("produtosList");
					for(Produto c: lista ){%>
				<tr>
						<td><center><%=c.getCod()%></center></td>
						<td><center><%=c.getProduto()%></center></td>
						<td><center><%=c.getPreco()%></center></td>
						<td><center><%=c.getCategoria()%></center></td>
						<td><center><%=c.getDescricao() %></center></td>
				</tr>
				<%
					}			
			%>
			<tr>
				<td colspan="6" align="center"><a href="cadastroProdutos.jsp">Página Inicial de Produtos</a></td>
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