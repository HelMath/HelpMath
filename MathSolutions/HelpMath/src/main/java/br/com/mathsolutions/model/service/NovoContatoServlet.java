package br.com.mathsolutions.model.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.mathsolutions.beans.Contato;
import br.com.mathsolutions.beans.Usuario;
import br.com.mathsolutions.dao.ContatoDao;
import br.com.mathsolutions.dao.UsuarioDao;

/**
 * Servlet implementation class NovoContato
 */
@WebServlet("/NovoContato")
public class NovoContatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NovoContatoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Date data = new Date();
			SimpleDateFormat formatador = new SimpleDateFormat("dd/MM/yyyy");
			formatador.format(data);
			
			int identificador = Integer.parseInt(request.getParameter("identificador"));
			String duvida = request.getParameter("duvida");
			
			Usuario u = new Usuario();
			u.setCod(identificador);
		
			Contato c = new Contato();
			c.setUser(u);
			c.setConteudo(duvida);
			c.setEnvio(formatador.format(data));
			
			ContatoDao l_dao = new ContatoDao();
			
			l_dao.GravarContato(c);
			
			request.setAttribute("mensagem", "true");
			
		} catch (Exception e) {
			System.out.println("Ocorreu um erro: " + e.getMessage());
			request.setAttribute("mensagem", "false");
		}
		finally {
			request.getRequestDispatcher("Index.jsp").forward(request, response);
		}
	}

}
