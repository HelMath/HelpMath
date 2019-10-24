package br.com.mathsolutions.bo;
import br.com.mathsolutions.beans.Usuario;
import br.com.mathsolutions.dao.UsuarioDao;
/**
 * Essa classe possui todos os métodos referentes as validações de um login/registro
 */
public class UsuarioBO {
	public InfoEnum ValidarUsuario(Usuario u) {
		try {
			UsuarioDao l_dao = new UsuarioDao();
			if(l_dao.BuscarUsuarioPorEmail(u.getEmail())) {
				return InfoEnum.UsuarioExiste;
			}else {
				return InfoEnum.Sucesso;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return InfoEnum.Erro;
	}

	public InfoEnum CadastrarUsuario(Usuario u) {
		try {
			UsuarioDao l_dao = new UsuarioDao();
			if(l_dao.Gravar(u)) {
				return InfoEnum.Sucesso;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return InfoEnum.Erro;
	}
}
