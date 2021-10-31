<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Excluir Categoria</title>
</head>
<body>
    <center>
        <table class="formu" border="1">
            <form action="ServletCategorias?cmd=exc" method="post">
            <tbody>
                <tr>
                    <th colspan="2"><h2>Excluir Categoria</h2></th>
                </tr>
                <tr>
                    <td>Código da Categoria:</td>
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
<style>
	 body {
    		background-color: lightgray;
    		font-family: Arial, Helvetica, sans-serif;
  		}
  	.formu{
  		margin-top: 300px;	
  	}
</style>

</body>
</html>
