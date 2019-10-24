package br.com.mathsolutions.model.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.mathsolutions.beans.Usuario;
import br.com.mathsolutions.dao.UsuarioDao;

/**
 * Servlet implementation class NovoLogin
 */
@WebServlet("/NovoLogin")
public class NovoLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NovoLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String senha = request.getParameter("senha");
			String email = request.getParameter("email");
			
			

			
			UsuarioDao l_dao = new UsuarioDao();
			
			Usuario l_user = l_dao.BuscarUsuarioPorEmailSenha(email,senha);
			
			if (l_user.getNome().equals("Empyt")) {

				request.setAttribute("INFO", "Ocorreu um erro ou suas credenciais estão inválidas. Tente novamente");
			}else {
				request.setAttribute("INFO", "Bem vindo, "+ l_user.getNome());
				request.setAttribute("COD_USER", l_user.getCod());
			}
		} catch (Exception e) {
			request.setAttribute("INFO", "Ocorreu um erro ou suas credenciais estão inválidas. Tente novamente. Exception: " + e);
		}finally {
			request.getRequestDispatcher("Info.jsp").forward(request, response);
			
		}
	}

}
