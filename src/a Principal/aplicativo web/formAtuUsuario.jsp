<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<html>
    <head>
        <title>Atualizar Usuário</title>
    </head>
    <body>
        <h3 align="center">Atualizar Usuário</h3>
        <jsp:useBean id="usuario" scope="session" class="br.edu.unicid.bean.Usuario" />
        
        <form action="ServletUsuario?cmd=atualizar" method="post">
            <center>
            <table>
            	<tr>
                    <td>Código:</td>
                    <td>
                        <input type="text" maxlength="60"  size = "60" name="txtCod" 
                            value="<%= usuario.getCod() %>" readonly="readonly" />
                    </td>
                </tr>
                <tr>
                    <td>Nome:</td>
                    <td>
                        <input type="text" maxlength="60"  size = "60" name="txtNome" 
                        value="<%= usuario.getNome() %>" />
                    </td>
                </tr>
                <tr>
                    <td>Idade:</td>
                    <td>
                        <input type="text" maxlength="60"  size = "60" name="txtIdade" 
                        value="<%= usuario.getIdade() %>"  />
                    </td>
                </tr>
                <tr>
                    <td>Usuario:</td>
                    <td>
                        <input type="text" maxlength="60"  size = "60" name="txtUsuario" 
                        value="<%= usuario.getUsuario() %>" />
                    </td>
                </tr>
                <tr>
                    <td>Senha:</td>
                    <td>
                        <input type="password" maxlength="60"  size = "60" name="txtSenha" 
                        value="<%= usuario.getSenha() %>" />
                    </td>
                </tr>
                
                <tr>
                    <th colspan="2">
                        <input type="submit" name="btnAlterar" value="Confirma Atualização" />
                    </th>
                </tr>		
            </table>
            </center>
        </form>
    </body>
    <style>
	 body {
    		background-color: lightgray;
    		font-family: Arial, Helvetica, sans-serif;
  		}
</style>
</html>