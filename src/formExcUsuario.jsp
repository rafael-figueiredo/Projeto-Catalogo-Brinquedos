<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<link rel="stylesheet" type="text/css" href="estilo.css" />
<title>Excluir Usuario</title>
</head>
<body>
	<h2 align="center">Exclusão da Usuarioa</h2>
	<jsp:useBean id="usuario" scope="session"
		class="br.edu.unicid.bean.Usuario" />
	
	<form action="ServletUsuario?cmd=excluir" method="post">
		<center>
			<table>
				<tr>
					<td>Código:</td>
					<td><input type="text" maxlength="60" size="60" name="txtCod"
						value="<%=usuario.getCod()%>" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Nome:</td>
					<td><input type="text" maxlength="60" size="60" name="txtNome"
						value="<%=usuario.getNome()%>" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Idade:</td>
					<td><input type="text" maxlength="60" size="60" name="txtIdade"
						value="<%=usuario.getIdade()%>" readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Usuario:</td>
					<td><input type="text" maxlength="60" size="60"
						name="txtUsuario" value="<%=usuario.getUsuario()%>"
						readonly="readonly" /></td>
				</tr>
				<tr>
					<td>Senha:</td>
					<td><input type="password" maxlength="60" size="60"
						name="txtSenha" value="<%=usuario.getSenha()%>"
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