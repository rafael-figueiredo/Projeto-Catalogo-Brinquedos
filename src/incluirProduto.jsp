
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.unicid.bean.*, br.edu.unicid.web.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Incluir Produto</title>
</head>
<body>
	<center>
		<table  class="formu" border="1" width="30%">
			<form action="ServletProduto" method="get">
				<input type="hidden" name="cmd" value="incluir">
				<tr>
					<th colspan="2"><h3>CADASTRO DE PRODUTOS</h3></th>
				</tr>
				<tr>
					<td>Código:</td>
					<td><input type="text" name="txtCod" size="35" maxlength="35"></td>
				</tr>
				<tr>
					<td>Produto:</td>
					<td><input type="text" name="txtProduto" size="35" maxlength="35"></td>
				</tr>
				<tr>
					<td>Preço:</td>
					<td><input type="text" name="txtPreco" size="35"
						maxlength="35"></td>
				</tr>
				<tr>
					<td>Categoria:</td>
					<td>
					<select   id="idCartegoria" name="idCartegoria">
					<option value="0">Selecione a cartegoria</option>
					
					 <%
						List<Categoria> categorias = new ServletCategorias().todasCartegorias();
						for(Categoria catergoria: categorias ) 
					{%>
					<option value="<%=catergoria.getCod()%>"><%=catergoria.getNome()%></option>
		 			<%}%>
		        </select>  
					</td>
				<tr>
					<td>Descrição:</td>
					<td><input type="text" name="txtDescricao" size="35"
						maxlength="35"></td>
				</tr>
				<tr>			
					<td colspan="2" align="center"><input type="submit" value="Gravar"></td>
				</tr>

			</form>
		</table>
	</center>

</body>

<style>
	 body{
    	background-color: lightgray;
    	font-family: Arial, Helvetica, sans-serif;
  	}
  		
  	.formu{
  		margin-top: 300px;	
  	}
</style>
</html>