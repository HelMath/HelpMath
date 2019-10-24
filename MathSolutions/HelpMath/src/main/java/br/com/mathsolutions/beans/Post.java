package br.com.mathsolutions.beans;
/**
 * Essa classe possui todos os atributos da tabela HM_POST
 */
public class Post {
	private String Tipo;
	private String Postagem;
	private String Titulo;
	private String Conteudo;
	private Usuario User;
	public String getTipo() {
		return Tipo;
	}
	public void setTipo(String tipo) {
		Tipo = tipo;
	}
	public String getPostagem() {
		return Postagem;
	}
	public void setPostagem(String postagem) {
		Postagem = postagem;
	}
	public String getTitulo() {
		return Titulo;
	}
	public void setTitulo(String titulo) {
		Titulo = titulo;
	}
	public String getConteudo() {
		return Conteudo;
	}
	public void setConteudo(String conteudo) {
		Conteudo = conteudo;
	}
	public Usuario getUser() {
		return User;
	}
	public void setUser(Usuario user) {
		User = user;
	}
	
	@Override
	public String toString() {
		return "{ Tipo: " + getTipo() + " Postagem: " + getPostagem() + " Titulo: " + getTitulo() + " Conteudo: " + getConteudo()
					+ " Usuario: " + getUser() + " }";
	}
}
