package com.ltweb.DTO;

public class Message {

    private String text;

    private String to;
    
    private String from;

    public String getText() {
        return text;
    }

	public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

	public void setText(String text) {
		this.text = text;
	}

	public String getFrom() {
		return from;
	}

	public void setFrom(String from) {
		this.from = from;
	}  
	
	
}