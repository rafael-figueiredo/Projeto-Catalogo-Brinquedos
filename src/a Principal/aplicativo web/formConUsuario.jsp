<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="estilo.css" />
<title>Consulta Usuário</title>
</head>
<body>
	<h2 align="center">Consulta de Usuários</h2>
	<jsp:useBean id="usuario" scope="session" class="br.edu.unicid.bean.Usuario" />

	<form>
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
					<td><input type="text" maxlength="60" size="60"
						name="txtIdade" value="<%=usuario.getIdade()%>"
						readonly="readonly" /></td>
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
					<td colspan="2" align="center"><a href="cadastroUsuarios.jsp">Página Inicial de Usuarios</a></td>
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