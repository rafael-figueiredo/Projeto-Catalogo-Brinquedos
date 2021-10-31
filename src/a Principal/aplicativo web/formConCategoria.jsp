<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="estilo.css" />
<title>Consulta Categorias</title>
</head>
<body>
	<h2 align="center">Consulta de Categorias</h2>
	<jsp:useBean id="categoria" scope="session" class="br.edu.unicid.bean.Categoria" />

	<form>
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
						name="txtFaixa" value="<%=categoria.getLinha()%>"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Faixa Etária:</td>
					<td><input type="text" maxlength="60" size="60"
						name="txtFaixaEtaria" value="<%=categoria.getFaixaEtaria()%>"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><a href="index.jsp">Página
							Principal</a></td>
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