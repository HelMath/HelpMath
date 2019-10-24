package br.com.mathsolutions.dao;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import br.com.mathsolutions.beans.PerguntaInedita;
import br.com.mathsolutions.beans.Usuario;
import br.com.mathsolutions.conexao.ConexaoFactory;

/**
 * Essa classe possui todos os métodos que irão manipular a tabela Pergunta Inedita
 */
public class PerguntaIneditaDao {
	private Connection conexao;

	public PerguntaIneditaDao() throws Exception {
		this.conexao = new ConexaoFactory().getConnection();
	}

	/**
	 * Ir� retonar Gravar algum erro encontrado durante a execu��o do Bot.
	 * 
	 * @return ArrayList<Post>
	 * @throws SQLException
	 */
	public boolean Gravar(PerguntaInedita p) {
		String sql = "insert into HM_PERGUNTA_INEDITA (COD_PERGUNTA, ST_LOCAL, ST_DESCRICAO, DT_ENVIO, FK_COD_USUARIO) "
				+ "values (SEQ_HM_PERGUNTA_INEDITA.NEXTVAL,'" + p.getLocal() + "','" + p.getDescricao() + "','TO_DATE('" + p.getEnvio()
				+ " ','DD/MM/YYYY HH:MM:SS')','" + p.getUser().getCod() + "')";
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
	 * Ir� retonar para a p�gina de Perguntas Inedidas a lista de todas as
	 * Perguntas!
	 * 
	 * @return ArrayList<PerguntaInedita>
	 * @throws SQLException
	 */
	public ArrayList<PerguntaInedita> BuscarPergunta() throws SQLException {
		ArrayList<PerguntaInedita> l_listPost = new ArrayList<PerguntaInedita>();

		ResultSet resultadoDados = null;
		PreparedStatement estrutura = null;
		try {
			estrutura = this.conexao.prepareStatement(
					"select * from HM_PERGUNTA_INEDITA p inner join HM_USUARIO u on p.FK_COD_USUARIO = u.COD_USUARIO");
			resultadoDados = estrutura.executeQuery();
			while (resultadoDados.next()) {

				PerguntaInedita l_tempPergunta = new PerguntaInedita();
				Usuario l_tempUsuario = new Usuario();
				l_tempPergunta.setCod(resultadoDados.getInt("COD_PERGUNTA"));
				l_tempPergunta.setDescricao(resultadoDados.getString("ST_DESCRICAO"));
				l_tempPergunta.setEnvio(resultadoDados.getString("DT_ENVIO"));
				l_tempPergunta.setLeitura(resultadoDados.getString("DT_LEITURA"));
				l_tempPergunta.setLocal(resultadoDados.getString("ST_LOCAL"));
				l_tempPergunta.setResultado(resultadoDados.getString("ST_RESULTADO"));
				l_tempUsuario.setNome(resultadoDados.getString("ST_NOME"));
				l_tempUsuario.setCod(resultadoDados.getInt("COD_USUARIO"));
				l_tempPergunta.setUser(l_tempUsuario);

				l_listPost.add(l_tempPergunta);
			}

			return l_listPost;
		} catch (SQLException e) {
			e.printStackTrace();
			return l_listPost;
		} finally {
			resultadoDados.close();
			estrutura.close();
		}
	}

	/**
	 * Ir� atualizar um problema encontrado incluindo uma resposta para a mesma.
	 * 
	 * @return boolean
	 * @throws False
	 */
	public boolean SetarResposta(PerguntaInedita pergunta) {
		String sql = "update HM_PERGUNTA_INEDITA set ST_RESULTADO = '" + pergunta.getResultado()
				+ "', DT_LEITURA = 'TO_DATE('" + LocalDateTime.now() + "','YYYY-MM-DD HH:MM:SS')'  where COD_PERGUNTA = '"
				+ pergunta.getCod() + "'";
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
