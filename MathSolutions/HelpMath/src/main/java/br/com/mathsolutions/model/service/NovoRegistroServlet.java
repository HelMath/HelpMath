package br.com.mathsolutions.model.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.mathsolutions.beans.Usuario;
import br.com.mathsolutions.bo.InfoEnum;
import br.com.mathsolutions.bo.UsuarioBO;

/**
 * Servlet implementation class NovoRegistro
 */
@WebServlet({ "/NovoRegistro", "/Registrar"})
public class NovoRegistroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NovoRegistroServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Usuario l_usuario = new Usuario();
			l_usuario.setNome(request.getParameter("nome"));
			l_usuario.setSenha(request.getParameter("senha"));
			l_usuario.setEmail(request.getParameter("email"));
			l_usuario.setTelefone(Integer.parseInt(request.getParameter("telefone")));
			l_usuario.setNascimento(request.getParameter("nascimento"));
			UsuarioBO l_bo = new UsuarioBO();
			if (l_bo.ValidarUsuario(l_usuario) == InfoEnum.Sucesso) {
				if(l_bo.CadastrarUsuario(l_usuario) == InfoEnum.Sucesso) {
					request.setAttribute("INFO", "Usuario criado com sucesso!");
				}else {
					request.setAttribute("INFO", "Ocorreu um erro ao cadastrar sua conta! Tente novamente mais tarde");
				}
			}else {
				request.setAttribute("INFO", "Ocorreu um erro ou o email já está em utilização! Tente novamente");
			}
		} catch (Exception e) {
			request.setAttribute("INFO", "Ocorreu um erro ao cadastrar sua conta! Tente novamente mais tarde. Exception: " +e);
		}finally {
			request.getRequestDispatcher("Info.jsp").forward(request, response);
		}	
	}

}
