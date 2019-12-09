package com.csu.gymms.entity;

import java.io.Serializable;

public class EmailBean implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String E_id;
	private String send_name;
	private String Send_grop;
	private String title;
	private String context;
	private String read;
	private String sendDate;
	private String userId;
	
	public EmailBean(){
		
	}
	
	public EmailBean(String E_id,String send_name,String Send_grop,String title,String context){
		this.E_id=E_id;
		this.Send_grop=send_name;
		this.send_name=send_name;
		this.title=title;
		this.context=context;
	}

	public String getE_id() {
		return E_id;
	}

	public void setE_id(String e_id) {
		E_id = e_id;
	}

	public String getSend_name() {
		return send_name;
	}

	public void setSend_name(String send_name) {
		this.send_name = send_name;
	}

	public String getSend_grop() {
		return Send_grop;
	}

	public void setSend_grop(String send_grop) {
		Send_grop = send_grop;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContext() {
		return context;
	}

	public void setContext(String context) {
		this.context = context;
	}

	public String getRead() {
		return read;
	}

	public void setRead(String read) {
		this.read = read;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}
}
