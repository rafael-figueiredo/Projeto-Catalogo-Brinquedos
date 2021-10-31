<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<html>
    <head>
        <title>Atualizar Categorias</title>
    </head>
    <body>
        <h3 align="center">Atualizar Categoria</h3>
        <jsp:useBean id="categoria" scope="session" class="br.edu.unicid.bean.Categoria" />
        
        <form action="ServletCategorias?cmd=atualizar" method="post">
            <center>
            <table>
            	<tr>
                    <td>Código:</td>
                    <td>
                        <input type="text" maxlength="60"  size = "60" name="txtCod" 
                            value="<%= categoria.getCod() %>" readonly="readonly" />
                    </td>
                </tr>
                <tr>
                    <td>Nome:</td>
                    <td>
                        <input type="text" maxlength="60"  size = "60" name="txtNome" 
                        value="<%= categoria.getNome() %>" />
                    </td>
                </tr>
                <tr>
                    <td>Linha:</td>
                    <td>
                        <input type="text" maxlength="60"  size = "60" name="txtLinha" 
                        value="<%= categoria.getLinha() %>"  />
                    </td>
                </tr>
                <tr>
                    <td>Faixa Etária:</td>
                    <td>
                        <input type="text" maxlength="60"  size = "60" name="txtFaixaEtaria" 
                        value="<%= categoria.getFaixaEtaria() %>" />
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