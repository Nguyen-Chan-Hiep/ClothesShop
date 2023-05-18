package com.ltweb.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.ltweb.DTO.Message;

@Controller
public class MessageController {

	@Autowired
	SimpMessagingTemplate simpMessagingTemplate;

	// Mapped as /app/application
	@MessageMapping("/application/{cid}")
	@SendTo("/all/messages-{cid}")
	public Message send(@Payload Message message) throws Exception {
		return message;
	}

	// Mapped as /app/private
	@MessageMapping("/private")
	public void sendToSpecificUser(@Payload Message message) {
		simpMessagingTemplate.convertAndSendToUser(message.getTo(), "/specific", message);
	}

}