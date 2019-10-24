package br.com.mathsolutions.dao;

import java.sql.*;

import br.com.mathsolutions.beans.Usuario;
import br.com.mathsolutions.conexao.ConexaoFactory;
/**
 * Essa classe possui todos os métodos que irão manipular a tabela Usuario
 */
public class UsuarioDao {
	private Connection conexao;

	public UsuarioDao() throws Exception {
		this.conexao = new ConexaoFactory().getConnection();
		System.out.println("Conectado!");
	}

	/**
	 * Ir� gravar um novo Usu�rio
	 * 
	 * @return boolean
	 * @throws False
	 */
	public boolean Gravar(Usuario u) {
		String sql = "INSERT INTO HM_USUARIO (cod_usuario,st_nome,dt_nascimento,nr_telefone,st_email,st_senha,st_adm) "
				+ " VALUES (SEQ_HM_USUARIO.NEXTVAL , '" + u.getNome() + "' , '" + u.getNascimento() + "' , "
				+ u.getTelefone() + " , '" + u.getEmail() + "' , '" + u.getSenha() + "' , 'N' )";
		try {
			PreparedStatement estrutura = conexao.prepareStatement(sql);
			estrutura.execute();
			estrutura.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * Ir� atualizar um usu�rio colocando ele como Administrador!
	 * 
	 * @return boolean
	 * @throws False
	 */
	public boolean SetarAdmistrador(int codUser) {
		String sql = "update HM_USUARIO set ST_ADM = 'Y' where COD_USUARIO = '" + codUser + "'";
		try {
			PreparedStatement estrutura = conexao.prepareStatement(sql);
			estrutura.execute();
			estrutura.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * Caso o usu�rio em pesquisa exista, ir� retornar o Nome e o ID do mesmo.
	 * 
	 * @return boolean
	 * @throws False
	 */
	public Usuario BuscarUsuarioPorEmailSenha(String email, String senha) throws SQLException {
		ResultSet resultadoDados = null;

		PreparedStatement estrutura = null;

		Usuario l_tempUsuario = new Usuario();

		l_tempUsuario.setNome("Empyt");
		try {
			estrutura = this.conexao
					.prepareStatement("SELECT COD_USUARIO, ST_NOME FROM HM_USUARIO where st_email = '" + email
							+ "' and st_senha = '" + senha + "'");

			resultadoDados = estrutura.executeQuery();
			if (resultadoDados.next()) {

				l_tempUsuario.setNome(resultadoDados.getString("ST_NOME"));
				l_tempUsuario.setCod(resultadoDados.getInt("COD_USUARIO"));

				return l_tempUsuario;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return l_tempUsuario;
		} finally {
			resultadoDados.close();
			estrutura.close();
		}
		return l_tempUsuario;
	}

	public boolean BuscarUsuarioPorEmail(String email) throws SQLException {
		ResultSet resultadoDados = null;
		PreparedStatement estrutura = null;
		try {
			estrutura = this.conexao
					.prepareStatement("select COD_USUARIO FROM HM_USUARIO where st_email = '" + email + "'");
			resultadoDados = estrutura.executeQuery();
			if (resultadoDados.next()) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			resultadoDados.close();
			estrutura.close();
		}
		return false;
	}
}
