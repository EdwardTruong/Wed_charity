package com.example.exception;

public class UserResouneException {

	private int status;
	private String messenger;
	private Long timeSpamt;
	public UserResouneException(int status, String messenger, Long timeSpamt) {
		this.status = status;
		this.messenger = messenger;
		this.timeSpamt = timeSpamt;
	}
	public UserResouneException() {
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getMessenger() {
		return messenger;
	}
	public void setMessenger(String messenger) {
		this.messenger = messenger;
	}
	public Long getTimeSpamt() {
		return timeSpamt;
	}
	public void setTimeSpamt(Long timeSpamt) {
		this.timeSpamt = timeSpamt;
	}
	
	
}
