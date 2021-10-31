package br.edu.unicid.dao;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

import br.edu.unicid.bean.Produto;
import br.edu.unicid.util.ConnectionFactory;

public class ProdutoDao {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private Produto produto;

	public ProdutoDao() throws Exception {
		// chama a classe ConnectionFactory e estabele uma conexão
		try {
			this.conn = ConnectionFactory.getConnection();
		} catch (Exception e) {
			throw new Exception("erro: \n" + e.getMessage());
		}
	}

	// método de salvar
	public void salvar(Produto produto) throws Exception {
		if (produto == null)
			throw new Exception("O valor passado nao pode ser nulo");
		try {
			String SQL = "INSERT INTO produtos (cod, produto, preco, categoria, descricao, IdCartegoria) values (?, ?, ?, ?, ?, ?)";
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, produto.getCod());
			ps.setString(2, produto.getProduto());
			ps.setDouble(3, produto.getPreco());
			ps.setString(4, produto.getCategoria());
			ps.setString(5, produto.getDescricao());
			ps.setInt(6, produto.getIdCartegoria());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao inserir dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}

	// método de atualizar
	public void atualizar(Produto produto) throws Exception {
		if (produto == null)
			throw new Exception("O valor passado nao pode ser nulo");
		try {
			String SQL = "UPDATE produtos set produto=?, preco=?, categoria=?, descricao=?, IdCartegoria=? WHERE cod = ?";
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setString(1, produto.getProduto());
			ps.setDouble(2, produto.getPreco());
			ps.setString(3, produto.getCategoria());
			ps.setString(4, produto.getDescricao());
			ps.setInt(5, produto.getIdCartegoria());
			ps.setInt(6, produto.getCod());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao alterar dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}

	// método de excluir
	public void excluir(Produto produto) throws Exception {
		if (produto == null)
			throw new Exception("O valor passado nao pode ser nulo");
		try {
			String SQL = "DELETE FROM produtos WHERE cod = ?";
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, produto.getCod());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao excluir dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}

	// procurar produto
	public Produto procurarProduto(int cod) throws Exception {

		try {
			String SQL = "SELECT produto.cod, produto, preco, categoria.nome, descricao, IdCartegoria FROM produtos as produto INNER JOIN categorias as categoria on categoria.cod = produto.IdCartegoria  WHERE produto.cod=?";
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, cod);
			rs = ps.executeQuery();
			if (rs.next()) {
				int codi = rs.getInt(1);
				String produ = rs.getString(2);
				double preco = rs.getDouble(3);	
				String categoria = rs.getString(4);
				String descricao = rs.getString(5);
				int idCartegoria = rs.getInt(6);
				produto = new Produto(codi, produ, preco, categoria, descricao, idCartegoria);
			}
			return produto;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}
	
	public List<Produto> procurarProdutosPorIdCartegoria(int id_cartegoria) throws Exception {
		try {
			String SQL = "SELECT produto.cod, produto, preco, categoria.nome, descricao, IdCartegoria FROM produtos as produto INNER JOIN categorias as categoria on categoria.cod = produto.IdCartegoria   WHERE produto.idCartegoria=?";
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, id_cartegoria);
			rs = ps.executeQuery();
			List<Produto> list = new ArrayList<Produto>();
			while (rs.next()) {
				int codi = rs.getInt(1);
				String produ = rs.getString(2);
				double preco = rs.getDouble(3);		
				String categoria = rs.getString(4);
				String descricao = rs.getString(5);
				int idCartegoria = rs.getInt(6);
				produto = new Produto(codi, produ, preco, categoria, descricao, idCartegoria);
				list.add(produto);
			}
			return list;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}

	// listar todos os alunos
	public List todosProdutos() throws Exception {
		try {
			conn = this.conn;
			ps = conn.prepareStatement("SELECT produto.cod, produto, preco, categoria.nome, descricao, IdCartegoria FROM produtos as produto INNER JOIN categorias as categoria on categoria.cod = produto.IdCartegoria ORDER BY produto.cod");
			rs = ps.executeQuery();
			List<Produto> list = new ArrayList<Produto>();
			while (rs.next()) {
				int codi = rs.getInt(1);
				String produ = rs.getString(2);
				double preco = rs.getDouble(3);		
				String categoria = rs.getString(4);
				String descricao = rs.getString(5);
				int idCartegoria = rs.getInt(6);
				produto = new Produto(codi, produ, preco, categoria, descricao, idCartegoria);
				list.add(produto);
			}
			return list;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}
}