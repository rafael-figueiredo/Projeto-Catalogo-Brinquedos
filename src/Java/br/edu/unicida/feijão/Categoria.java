package br.edu.unicid.bean;

public class Categoria {

	// padr�o JavaBean ou POJO � Classe com getters/setters, mais m�todos
	// construtores

	private int cod;
	private String nome, linha, faixaEtaria;
	
	public Categoria(int cod, String nome, String linha, String faixaEtaria) {
		this.cod = cod;
		this.nome = nome;
		this.linha = linha;
		this.faixaEtaria = faixaEtaria;
	}
	
	public Categoria() {
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

	public String getLinha() {
		return linha;
	}

	public void setLinha(String linha) {
		this.linha = linha;
	}

	public String getFaixaEtaria() {
		return faixaEtaria;
	}

	public void setFaixaEtaria(String faixaEtaria) {
		this.faixaEtaria = faixaEtaria;
	}
}
