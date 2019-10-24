package br.com.mathsolutions.model.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.ibm.cloud.sdk.core.service.security.IamOptions;
import com.ibm.watson.assistant.v1.Assistant;
import com.ibm.watson.assistant.v1.model.Context;
import com.ibm.watson.assistant.v1.model.MessageInput;
import com.ibm.watson.assistant.v1.model.MessageOptions;
import com.ibm.watson.assistant.v1.model.MessageResponse;


/**
 * Servlet implementation class AssistantV1Servlet
 */
@WebServlet("/v1")
public class AssistantV1Servlet extends HttpServlet {
	
	private Context context = null;
	private static final long serialVersionUID = -8716683257301345455L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		String msg = req.getParameter("question");

		MessageResponse response = this.assistantAPICall(msg);
		
		resp.setContentType("application/json");
		resp.getWriter().write(new Gson().toJson(response.getOutput().getText()));
	
	}

	private MessageResponse assistantAPICall(String msg) {

		// Configuração de autenticação do serviço *********************************************
		IamOptions options = new IamOptions.Builder()
				//Colocar a sua APIKEY
				.apiKey("mfpvCsxppFWD8MjtHNiO085a48r46V4_sapg5rzW5EFj")
				.build();
		
		// Criando o objeto do serviço desejado ************************************************
		
		Assistant service = new Assistant("2018-02-16", options);
		      //Colocar a sua WORKSPACEID
		String workspaceId = "0e30b540-25fa-43ef-96fd-4c670930552d";
		
		// Preparando a mensagem de envio *****************************************************
		MessageInput input = new MessageInput();
		input.setText(msg);
		
		// Configurando os parametros para o Watson *******************************************
		MessageOptions messageOptions = new MessageOptions.Builder()
				.workspaceId(workspaceId) // passa a api ket
				.input(input)   			// passa o que eu digitei
				.context(this.context)      // onde vai ser salvo o json
				.build();
		
		// Conectando com o Assistant e recebendo a resposta dele ******************************
		MessageResponse response  = service.message(messageOptions)
				.execute() 	// manda pro chatbot e executa o input que mandei
				.getResult(); // retorna o resultado
		 
		this.context = response.getContext(); // insere o json
		

		return response;
	}

}
