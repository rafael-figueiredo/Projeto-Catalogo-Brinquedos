<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Consultar Produto</title>
</head>
<body>
   <center>
        <table class="formu" border="1">
            <form action="ServletProduto?cmd=con" method="post">
            <tbody>
                <tr>
                    <th colspan="2"><h2>Consultar Produtos</h2></th>
                </tr>
                <tr>
                    <td>Código da Produtos:</td>
                    <td>
                        <input type="text" name="txtCod" size="10" maxlenght="10" />
                    </td>
                </tr>

                <tr>
                    <td colspan="2" align="center"><input type="submit" value="Enviar"></td>
                </tr>
            </tbody>
           </form>
        </table>
    </center>

</body>
<style>
	 body {
    		background-color: lightgray;
    		font-family: Arial, Helvetica, sans-serif;
  		}
  	.formu{
  		margin-top: 300px;	
  	}
</style>
</html>
