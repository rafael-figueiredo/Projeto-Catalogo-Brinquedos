<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.unicid.bean.Usuario" %>

<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1" %>

<html>
<head>
<title>Lista Usu�rios</title>
</head>
<body>
	<center>
		<table width="100%" border="1" cellpadding="2" cellspacing="0">
			<tr>
				<th colspan="6"><h3>Lista de Usu�rios</h3></th>
			</tr>
			<tr>
				<th>Nome</th>
				<th>C�digo - Atualizar</th>
				<th>Idade</th>
				<th>Usu�rio</th>
				<th>Senha</th>
			</tr>
				<%
					List<Usuario> lista = new ArrayList<Usuario>();
					lista = (ArrayList) request.getAttribute("usuarioList");
					for(Usuario c: lista ){%>
				<tr>
						<td><center><%=c.getNome()%></center></td>
						<td><center><%=c.getCod()%></center></td>
						<td><center><%=c.getIdade()%></center></td>
						<td><center><%=c.getUsuario()%></center></td>
						<td><center><%=c.getSenha()%></center></td>
				</tr>
				<%
					}			
			%>
			<tr>
				<td colspan="6" align="center"><a href="cadastroUsuarios.jsp">P�gina Inicial de Usu�rios</a></td>
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