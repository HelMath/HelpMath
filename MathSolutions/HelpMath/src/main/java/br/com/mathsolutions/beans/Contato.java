package br.com.mathsolutions.beans;
/**
 * Essa classe possui todos os atributos da tabela HM_CONTATO
 */
public class Contato {
	private int Cod;
	private String Assunto;
	private String Conteudo;
	private String Envio;
	private String Leitura;
	private String Resposta;
	private Usuario User;
	public String getAssunto() {
		return Assunto;
	}
	public void setAssunto(String assunto) {
		Assunto = assunto;
	}
	public String getConteudo() {
		return Conteudo;
	}
	public void setConteudo(String conteudo) {
		Conteudo = conteudo;
	}
	public String getEnvio() {
		return Envio;
	}
	public void setEnvio(String envio) {
		Envio = envio;
	}
	public String getLeitura() {
		return Leitura;
	}
	public void setLeitura(String leitura) {
		Leitura = leitura;
	}
	public String getResposta() {
		return Resposta;
	}
	public void setResposta(String resposta) {
		Resposta = resposta;
	}
	public Usuario getUser() {
		return User;
	}
	public void setUser(Usuario user) {
		User = user;
	}
	public int getCod() {
		return Cod;
	}
	public void setCod(int cod) {
		Cod = cod;
	}
	
	@Override
	public String toString() {
		
		return "{ CodContato: " + getCod() + " Assunto: " + getAssunto() + " Conteudo: " +  getConteudo() + " Envio: " 
				+ getLeitura() + " Respostas: " + getResposta() + " Usuario: " + getUser() + " }";
	}
	
}
