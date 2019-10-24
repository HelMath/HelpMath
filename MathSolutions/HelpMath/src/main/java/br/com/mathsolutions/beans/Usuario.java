package br.com.mathsolutions.beans;
/**
 * Essa classe possui todos os atributos da tabela HM_USUARIO
 */
public class Usuario {
	private int Cod;
	private String Nascimento;
	private long Telefone;
	private String Email;
	private String Senha;
	private String ADM;
	private String Nome;
	public String getNascimento() {
		return Nascimento;
	}
	public void setNascimento(String nascimento) {
		Nascimento = nascimento;
	}
	public long getTelefone() {
		return Telefone;
	}
	public void setTelefone(long telefone) {
		Telefone = telefone;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getSenha() {
		return Senha;
	}
	public void setSenha(String senha) {
		Senha = senha;
	}
	public String getADM() {
		return ADM;
	}
	public void setADM(String aDM) {
		ADM = aDM;
	}
	public int getCod() {
		return Cod;
	}
	public void setCod(int cod) {
		Cod = cod;
	}
	public String getNome() {
		return Nome;
	}
	public void setNome(String nome) {
		Nome = nome;
	}
	
	@Override
	public String toString() {
		
		return "{ COD_USUARIO: " + getCod() + " NOME: " + getNome() + " EMAIL: " +  getEmail() + " SENHA: " 
					+ getSenha() + " ADMINISTRADOR: " + getADM() + " TELEFONE: " + getTelefone() + " NASCIMENTO: " +
					getNascimento() + " } ";
	}
}
