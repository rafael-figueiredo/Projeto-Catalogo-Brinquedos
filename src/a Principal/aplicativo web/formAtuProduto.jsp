
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.List" %>
<%@ page import="br.edu.unicid.bean.*, br.edu.unicid.web.*" %>

<%@page contentType="text/html"%>
<%@page pageEncoding="ISO-8859-1"%>

<html>
    <head>
        <title>Atualizar Produto</title>
    </head>
    <body>
        <h3 align="center">Atualizar Produto</h3>
        <jsp:useBean id="produto" scope="session" class="br.edu.unicid.bean.Produto" />
        
        <form action="ServletProduto?cmd=atualizar" method="post">
            <center>
            <table>
            	<tr>
                    <td>Código:</td>
                    <td>
                        <input type="text" maxlength="60"  size = "60" name="txtCod" 
                            value="<%= produto.getCod() %>" readonly="readonly" />
                    </td>
                </tr>
                <tr>
                    <td>Produto:</td>
                    <td>
                        <input type="text" maxlength="60"  size = "60" name="txtProduto" 
                        value="<%= produto.getProduto() %>" />
                    </td>
                </tr>
                <tr>
                    <td>Preço:</td>
                    <td>
                        <input type="text" maxlength="60"  size = "60" name="txtPreco" 
                        value="<%= produto.getPreco() %>"  />
                    </td>
                </tr>
                <tr>
                    <td>Categoria:</td>
                    
                    <td>
						<select id="idCartegoria" name="idCartegoria">
							<%
								List<Categoria> categorias = new ServletCategorias().todasCartegorias();
								for(Categoria catergoria: categorias ) 
							{%>
							<option value="<%=catergoria.getCod()%>"   
								<%if ((catergoria.getCod())==(produto.getIdCartegoria())) {%> selected <%}%> > <%=catergoria.getNome()%></option>
				 			<%}%>
				        </select>  
					</td>                   
                </tr>
                    <tr>
                    <td>Descrição:</td>
                    <td>
                        <input type="text" maxlength="60"  size = "60" name="txtDescricao" 
                        value="<%= produto.getDescricao()%>" />
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