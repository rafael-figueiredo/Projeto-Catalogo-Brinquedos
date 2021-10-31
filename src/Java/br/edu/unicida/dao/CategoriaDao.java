package br.edu.unicid.dao;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

import br.edu.unicid.bean.Categoria;
import br.edu.unicid.util.ConnectionFactory;

public class CategoriaDao {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private Categoria categoria;

	public CategoriaDao() throws Exception {
		// chama a classe ConnectionFactory e estabele uma conex�o
		try {
			this.conn = ConnectionFactory.getConnection();
		} catch (Exception e) {
			throw new Exception("erro: \n" + e.getMessage());
		}
	}

	// m�todo de salvar
	public void salvar(Categoria categoria) throws Exception {
		if (categoria == null)
			throw new Exception("O valor passado nao pode ser nulo");
		try {
			String SQL = "INSERT INTO categorias (cod, nome, linha, faixaEtaria) values (?, ?, ?, ?)";
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, categoria.getCod());
			ps.setString(2, categoria.getNome());
			ps.setString(3, categoria.getLinha());
			ps.setString(4, categoria.getFaixaEtaria());		
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao inserir dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}

	// m�todo de atualizar
	public void atualizar(Categoria categoria) throws Exception {
		if (categoria == null)
			throw new Exception("O valor passado nao pode ser nulo");
		try {
			String SQL = "UPDATE categorias set nome=?, linha=?, faixaEtaria=? WHERE cod = ?";
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setString(1, categoria.getNome());
			ps.setString(2, categoria.getLinha());
			ps.setString(3, categoria.getFaixaEtaria());
			ps.setInt(4, categoria.getCod());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao alterar dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}

	// m�todo de excluir
	public void excluir(Categoria categoria) throws Exception {
		if (categoria == null)
			throw new Exception("O valor passado nao pode ser nulo");
		try {
			String SQL = "DELETE FROM categorias WHERE cod = ?";
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, categoria.getCod());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao excluir dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}

	// procurar categoria
	public Categoria procurarCategoria(int cod) throws Exception {

		try {
			String SQL = "SELECT  * FROM categorias WHERE cod=?";
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, cod);
			rs = ps.executeQuery();
			if (rs.next()) {
				int codi = rs.getInt(1);
				String nome = rs.getString(2);
				String linha = rs.getString(3);	
				String faixaEta = rs.getString(4);
				categoria = new Categoria(codi, nome, linha, faixaEta);
			}
			return categoria;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}

	// listar todos os alunos
	public List todasCategorias() throws Exception {
		try {
			conn = this.conn;
			ps = conn.prepareStatement("SELECT * FROM categorias");
			rs = ps.executeQuery();
			List<Categoria> list = new ArrayList<Categoria>();
			while (rs.next()) {
				int codi = rs.getInt(1);
				String nome = rs.getString(2);
				String linha = rs.getString(3);		
				String faixaEta = rs.getString(4);
				list.add(new Categoria(codi, nome, linha, faixaEta));
			}
			return list;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}
}
