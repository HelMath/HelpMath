package br.com.mathsolutions.dao;

import java.sql.*;
import java.util.ArrayList;

import br.com.mathsolutions.beans.Post;
import br.com.mathsolutions.beans.Usuario;
import br.com.mathsolutions.conexao.ConexaoFactory;
/**
 * Essa classe possui todos os métodos que irão manipular a tabela Post
 */
public class PostDao {
	private Connection conexao;

	public PostDao() throws Exception {
		this.conexao = new ConexaoFactory().getConnection();
	}
	/**
	 * Ir� gravar um novo Post!
	 * @return boolean
	 * @throws False
	 */
	public boolean Gravar(Post p) {
		String sql = "insert into HM_POST(COD_POST,ST_TIPO,DT_POSTAGEM,ST_TITULO,ST_CONTEUDO,FK_COD_USUARIO)"
				+ "values (SEQ_HM_POST.NEXTVAL,'" + p.getTipo() + "', TO_DATE('" + p.getPostagem() + " ','DD/MM/YYYY HH:MM:SS'),'"
				+ p.getTitulo() + "','" + p.getConteudo() + "'," + p.getUser().getCod() + ")";
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
	 * Ir� retonar para a p�gina de Blog a lista de todas as Postagens!
	 * @return ArrayList<Post>
	 * @throws SQLException
	 */
	public ArrayList<Post> BuscarPost() throws SQLException {
		ArrayList<Post> l_listPost = new ArrayList<Post>();

		ResultSet resultadoDados = null;
		PreparedStatement estrutura = null;
		try {
			estrutura = this.conexao.prepareStatement(
					"select ST_TITULO, DT_POSTAGEM , ST_CONTEUDO , ST_TIPO from HM_POST");
			resultadoDados = estrutura.executeQuery();
			while (resultadoDados.next()) {

				Post l_tempPost = new Post();
				Usuario l_tempUsuario = new Usuario();
				l_tempPost.setTitulo(resultadoDados.getString("ST_TITULO"));
				l_tempPost.setPostagem(resultadoDados.getString("DT_POSTAGEM").substring(0, 10));
				l_tempPost.setConteudo(resultadoDados.getString("ST_CONTEUDO"));
				l_tempPost.setTipo(resultadoDados.getString("ST_TIPO"));
				l_listPost.add(l_tempPost);
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
}
