<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Incluir Usuario</title>
</head>
<body>
	<center>
		<table  class="formu" border="1" width="30%">
			<form action="ServletUsuario" method="get">
				<input type="hidden" name="cmd" value="incluir">
				<tr>
					<th colspan="2"><h3>CADASTRO DE USUARIOS</h3></th>
				</tr>
				<tr>
					<td>Código:</td>
					<td><input type="text" name="txtCod" size="35" maxlength="35"></td>
				</tr>
				<tr>
					<td>Nome:</td>
					<td><input type="text" name="txtNome" size="35" maxlength="35"></td>
				</tr>
				<tr>
					<td>Idade:</td>
					<td><input type="text" name="txtIdade" size="35"
						maxlength="35"></td>
				</tr>
				<tr>
					<td>Usuário:</td>
					<td><input type="text" name="txtUsuario" size="35"
						maxlength="35"></td>
				</tr>
				<tr>
					<td>Senha:</td>
					<td><input type="password" name="txtSenha" size="35"
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