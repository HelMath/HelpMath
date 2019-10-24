package br.com.mathsolutions.conexao;

import java.sql.*;
import java.sql.DriverManager;
/**
 * Essa classe irá iniciar uma nova conexão com a base de dados
 */
public class ConexaoFactory {
	public Connection getConnection() throws Exception {
		return DriverManager.getConnection("jdbc:oracle:thin:@oracle.fiap.com.br:1521:orcl","rm83212","230399");
	}
} 
