package br.edu.unicid.bean;

public class Usuario {

	private int cod, idade;
	private String 	nome, usuario, senha;
	
	public Usuario(int cod, String nome, int idade, String usuario, String senha) {
		this.cod = cod;
		this.nome = nome;
		this.idade = idade;
		this.usuario = usuario;
		this.senha = senha;
	}
	
	public Usuario(){
		
	}
	
	public int getCod() {
		return cod;
	}

	public void setCod(int cod) {
		this.cod = cod;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getIdade() {
		return idade;
	}

	public void setIdade(int idade) {
		this.idade = idade;
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
}
