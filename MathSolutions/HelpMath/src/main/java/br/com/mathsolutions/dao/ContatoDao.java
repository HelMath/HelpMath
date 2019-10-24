package br.com.mathsolutions.dao;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;

import br.com.mathsolutions.beans.Contato;
import br.com.mathsolutions.beans.Usuario;
import br.com.mathsolutions.conexao.ConexaoFactory;
/**
 * Essa classe possui todos os métodos que irão manipular a tabela Contato
 */
public class ContatoDao {
	private Connection conexao;

	public ContatoDao() throws Exception {
		this.conexao = new ConexaoFactory().getConnection();
	}

	/**
	 * Irá gravar um novo contato da página Contate-nos
	 * 
	 * @param Contato
	 * @return boolean
	 */
	public boolean GravarContato(Contato c) {
		String sql = "INSERT INTO HM_CONTATO (COD_CONTATO, FK_COD_USUARIO , ST_CONTEUDO, DT_ENVIO)" + 
				" VALUES (SEQ_HM_CONTATO.NEXTVAL, "+ c.getUser().getCod() + ", "
						+ "'" + c.getConteudo() + " ', TO_DATE(' " + c.getEnvio() + "','DD/MM/YYYY'))";
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
	 * Ir� retornar a lista de todos os contatos feitos na p�gina!
	 * 
	 * @return ArrayList<Contato>
	 * @throws SQLException
	 */
	public ArrayList<Contato> BuscarContato() throws SQLException {
		ArrayList<Contato> l_listContato = new ArrayList<Contato>();

		ResultSet resultadoDados = null;
		PreparedStatement estrutura = null;
		try {
			estrutura = this.conexao.prepareStatement(
					"select * from HM_CONTATO p inner join HM_USUARIO u on p.FK_COD_USUARIO = u.COD_USUARIO");
			resultadoDados = estrutura.executeQuery();
			while (resultadoDados.next()) {
				Contato l_tempContato = new Contato();
				Usuario l_tempUsuario = new Usuario();
				l_tempContato.setCod(resultadoDados.getInt("COD_PERGUNTA"));
				l_tempContato.setAssunto(resultadoDados.getString("ST_ASSUNTO"));
				l_tempContato.setEnvio(resultadoDados.getString("DT_ENVIO"));
				l_tempContato.setLeitura(resultadoDados.getString("DT_LEITURA"));
				l_tempContato.setConteudo(resultadoDados.getString("ST_CONTEUDO"));
				l_tempContato.setResposta(resultadoDados.getString("ST_RESPOSTA"));
				l_tempUsuario.setNome(resultadoDados.getString("ST_NOME"));
				l_tempUsuario.setCod(resultadoDados.getInt("COD_USUARIO"));
				l_tempContato.setUser(l_tempUsuario);

				l_listContato.add(l_tempContato);
			}

			return l_listContato;
		} catch (SQLException e) {
			e.printStackTrace();
			return l_listContato;
		} finally {
			resultadoDados.close();
			estrutura.close();
		}
	}

	/**
	 * Ir� atualizar um contato feito por um usu�rio, atualizando campo de resposta!
	 * 
	 * @return boolean
	 * @throws False
	 */
	public boolean SetarResposta(Contato contato) {
		String sql = "update HM_PERGUNTA_INEDITA set ST_RESPOSTA = '" + contato.getResposta()
				+ "', DT_LEITURA = 'TO_DATE('" + LocalDateTime.now()
				+ "','YYYY-MM-DD HH:MM:SS')'  where COD_PERGUNTA = '" + contato.getCod() + "'";
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
}
