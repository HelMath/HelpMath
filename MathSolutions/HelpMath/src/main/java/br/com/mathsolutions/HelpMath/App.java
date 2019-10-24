package br.com.mathsolutions.HelpMath;

import java.sql.Connection;

import br.com.mathsolutions.beans.Usuario;
import br.com.mathsolutions.conexao.ConexaoFactory;
import br.com.mathsolutions.dao.UsuarioDao;

/**
 * Essa classe serve de testes de conexão
 */
public class App 
{
	private static Connection conexao;
    public static void main( String[] args )
    {
    	try {
			conexao = new ConexaoFactory().getConnection();
		} catch (Exception e1) {
			e1.printStackTrace();
		}
    }
}
