package br.edu.unicid.dao;

import java.sql.*;
import java.util.List;
import java.util.ArrayList;

import br.edu.unicid.bean.Usuario;
import br.edu.unicid.util.ConnectionFactory;

public class UsuarioDao {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	private Usuario usuario;

	public UsuarioDao() throws Exception {
		// chama a classe ConnectionFactory e estabele uma conexão
		try {
			this.conn = ConnectionFactory.getConnection();
		} catch (Exception e) {
			throw new Exception("erro: \n" + e.getMessage());
		}
	}

	// método de salvar
	public void salvar(Usuario usuario) throws Exception {
		if (usuario == null)
			throw new Exception("O valor passado nao pode ser nulo");
		try {
			String SQL = "INSERT INTO usuario (cod, nome, idade, usuario, senha) values (?, ?, ?, ?, ?)";
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, usuario.getCod());
			ps.setString(2, usuario.getNome());
			ps.setInt(3, usuario.getIdade());
			ps.setString(4, usuario.getUsuario());	
			ps.setString(5, usuario.getSenha());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao inserir dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}

	// método de atualizar
	public void atualizar(Usuario usuario) throws Exception {
		if (usuario == null)
			throw new Exception("O valor passado nao pode ser nulo");
		try {
			String SQL = "UPDATE usuario set nome=?, idade=?, usuario=?, senha=? WHERE cod = ?";
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setString(1, usuario.getNome());
			ps.setInt(2, usuario.getIdade());
			ps.setString(3, usuario.getUsuario());
			ps.setString(4, usuario.getSenha());
			ps.setInt(5, usuario.getCod());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao alterar dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}

	// método de excluir
	public void excluir(Usuario usuario) throws Exception {
		if (usuario == null)
			throw new Exception("O valor passado nao pode ser nulo");
		try {
			String SQL = "DELETE FROM usuario WHERE cod = ?";
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, usuario.getCod());
			ps.executeUpdate();
		} catch (SQLException sqle) {
			throw new Exception("Erro ao excluir dados " + sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps);
		}
	}

	// procurar usuario
	public Usuario procurarUsuario(int cod) throws Exception {

		try {
			String SQL = "SELECT  * FROM usuario WHERE cod=?";
			conn = this.conn;
			ps = conn.prepareStatement(SQL);
			ps.setInt(1, cod);
			rs = ps.executeQuery();
			if (rs.next()) {
				int codi = rs.getInt(1);
				String nome = rs.getString(2);
				int idade = rs.getInt(3);	
				String usuario1 = rs.getString(4);
				String senha = rs.getString(5);
				usuario = new Usuario(codi, nome, idade, usuario1, senha);
			}
			return usuario;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}

	// listar todos os usuario
	public List todosUsuarios() throws Exception {
		try {
			conn = this.conn;
			ps = conn.prepareStatement("SELECT * FROM usuario");
			rs = ps.executeQuery();
			List<Usuario> list = new ArrayList<Usuario>();
			while (rs.next()) {
				int codi = rs.getInt(1);
				String nome = rs.getString(2);
				int idade = rs.getInt(3);		
				String usuario1 = rs.getString(4);
				String senha = rs.getString(5);
				list.add(new Usuario(codi, nome, idade, usuario1,senha));
			}
			return list;
		} catch (SQLException sqle) {
			throw new Exception(sqle);
		} finally {
			ConnectionFactory.closeConnection(conn, ps, rs);
		}
	}
}
