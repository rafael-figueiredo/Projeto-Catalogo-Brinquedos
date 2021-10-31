
package br.edu.unicid.bean;
import java.text.NumberFormat;
import java.util.Locale;

public class Produto {
	private int cod, idCartegoria;	
	private String produto, categoria, descricao;
	private double preco;
	
	public Produto(int cod, String produto, double preco, String categoria, String descricao, int idCartegoria) {
		this.cod = cod;
		this.produto = produto;
		this.preco = preco;
		this.categoria = categoria;
		this.descricao = descricao;
		this.idCartegoria = idCartegoria;
	}
	
	public Produto() {
	}
	
	public int getCod() {
		return cod;
	}
	public void setCod(int cod) {
		this.cod = cod;
	}
	public String getProduto() {
		return produto;
	}
	public void setProduto(String produto) {
		this.produto = produto;
	}
	public String getCategoria() {
		return categoria;
	}
	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public double getPreco() {
		return preco;
	}
	public String getPrecoFormatBr() {
		Locale localeBR = new Locale("pt","BR");
		NumberFormat dinheiro = NumberFormat.getCurrencyInstance(localeBR);
		return dinheiro.format(preco);
	}
	public void setPreco(double preco) {
		this.preco = preco;
	}
	public int getIdCartegoria() {
		return idCartegoria;
	}

	public void setIdCartegoria(int idCartegoria) {
		this.idCartegoria = idCartegoria;
	}
}
