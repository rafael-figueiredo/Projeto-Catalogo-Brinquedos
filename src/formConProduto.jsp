<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="estilo.css" />
<title>Consulta Produto</title>
</head>
<body>
	<h2 align="center">Consulta de Produtos</h2>
	<jsp:useBean id="produto" scope="session" class="br.edu.unicid.bean.Produto" />

	<form>
		<center>
			<table>
				<tr>
					<td>Código:</td>
					<td><input type="text" maxlength="60" size="60" name="txtCod"
						value="<%=produto.getCod()%>" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Produto:</td>
					<td><input type="text" maxlength="60" size="60" name="txtProduto"
						value="<%=produto.getProduto()%>" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Preço:</td>
					<td><input type="text" maxlength="60" size="60"
						name="txtPreco" value="<%=produto.getPreco()%>"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Categoria:</td>
					<td><input type="text" maxlength="60" size="60"
						name="txtCategoria" value="<%=produto.getCategoria()%>"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Descrição:</td>
					<td><input type="text" maxlength="60" size="60"
						name="txtDescricao" value="<%=produto.getDescricao()%>"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><a href="cadastroProdutos.jsp">Página Inicial de Produtos</a></td>
				</tr>
			</table>
		</center>
	</form>
	<style>
	 body {
    		background-color: lightgray;
    		font-family: Arial, Helvetica, sans-serif;
  		}
</style>
</body>
</html>