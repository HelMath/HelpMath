package br.com.mathsolutions.beans;
/**
 * Essa classe possui todos os atributos da tabela HM_PERGUNTA_INEDITA
 */
public class PerguntaInedita {
	private int Cod;
	private String Local;
	private String Descricao;
	private String Envio;
	private String Leitura;
	private String Resultado;
	private Usuario User;
	public String getLocal() {
		return Local;
	}
	public void setLocal(String local) {
		Local = local;
	}
	public String getDescricao() {
		return Descricao;
	}
	public void setDescricao(String descricao) {
		Descricao = descricao;
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
	public String getResultado() {
		return Resultado;
	}
	public void setResultado(String resultado) {
		Resultado = resultado;
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
		return "{ CodigoPostagem: " + getCod() + " Local: " + getLocal() + " Descrição: " + getDescricao() + " Envio: "
					+ getEnvio() + " Leitura: " + getLeitura() + " Resultado: " + getResultado() + " Usuario: " + getUser()
					+ " }";
	}
}
