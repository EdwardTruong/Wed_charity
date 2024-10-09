package com.example.exception;




public class DonationResouneException {

	
	
	private int status;
	private String messenger;
	private Long timeSpamt;
	
	
	
	
	public DonationResouneException(int status, String messenger, Long timeSpamt) {
	
		this.status = status;
		this.messenger = messenger;
		this.timeSpamt = timeSpamt;
	}
	
	
	
	public DonationResouneException() {
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
