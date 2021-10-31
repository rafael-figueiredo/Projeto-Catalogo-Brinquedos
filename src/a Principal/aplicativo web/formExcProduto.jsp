<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" type="text/css" href="estilo.css" />
<title>Excluir Produto</title>
</head>
<body>
	<h2 align="center">Exclusão da Produto</h2>
	<jsp:useBean id="produto" scope="session"
		class="br.edu.unicid.bean.Produto" />
	
	<form action="ServletProduto?cmd=excluir" method="post">
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
					<th colspan="2"><input type="submit" maxlength="60" size="60"
						name="btnExcluir" value="Confirma Exclusão" /></th>
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