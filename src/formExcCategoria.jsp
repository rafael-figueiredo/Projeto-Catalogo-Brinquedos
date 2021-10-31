<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" type="text/css" href="estilo.css" />
<title>Excluir Categoria</title>
</head>
<body>
	<h2 align="center">Exclusão da Categoria</h2>
	<jsp:useBean id="categoria" scope="session"
		class="br.edu.unicid.bean.Categoria" />
	
	<form action="ServletCategorias?cmd=excluir" method="post">
		<center>
			<table>
				<tr>
					<td>Código:</td>
					<td><input type="text" maxlength="60" size="60" name="txtCod"
						value="<%=categoria.getCod()%>" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Nome:</td>
					<td><input type="text" maxlength="60" size="60" name="txtNome"
						value="<%=categoria.getNome()%>" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Linha:</td>
					<td><input type="text" maxlength="60" size="60"
						name="txtLinha" value="<%=categoria.getLinha()%>"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Faixa Etária:</td>
					<td><input type="text" maxlength="60" size="60"
						name="txtFaixaEtaria" value="<%=categoria.getFaixaEtaria()%>"
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