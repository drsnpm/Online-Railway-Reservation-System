package com.entity;

public class Ticket {
	private int id;
	private int pass_id;
	private String pass_name;
	private String pass_phno;
	private int train_id;
    private String train_number;
    private String train_name;
    private String train_departure;
    private String train_arrival;
    private String train_depDate;
    private String train_depTime;
    private String train_arrDate;
    private String train_arrTime; 
    private double amount;
    private String payment_code;
    private String confirmation;
	
    public Ticket() {
        super();
    }
    
	public Ticket(int id, String confirmation) {
		super();
		this.id = id;
		this.confirmation = confirmation;
	}
	public Ticket(int pass_id, String pass_name, String pass_phno, int train_id, String train_number, String train_name,
			String train_departure, String train_arrival, String train_depDate, String train_depTime,
			String train_arrDate, String train_arrTime, double amount, String payment_code, String confirmation) {
		super();
		this.pass_id = pass_id;
		this.pass_name = pass_name;
		this.pass_phno = pass_phno;
		this.train_id = train_id;
		this.train_number = train_number;
		this.train_name = train_name;
		this.train_departure = train_departure;
		this.train_arrival = train_arrival;
		this.train_depDate = train_depDate;
		this.train_depTime = train_depTime;
		this.train_arrDate = train_arrDate;
		this.train_arrTime = train_arrTime;
		this.amount = amount;
		this.payment_code = payment_code;
		this.confirmation = confirmation;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPass_id() {
		return pass_id;
	}

	public void setPass_id(int pass_id) {
		this.pass_id = pass_id;
	}
	public String getPass_name() {
		return pass_name;
	}
	public void setPass_name(String pass_name) {
		this.pass_name = pass_name;
	}
	public String getPass_phno() {
		return pass_phno;
	}
	public void setPass_phno(String pass_phno) {
		this.pass_phno = pass_phno;
	}
	public int getTrain_id() {
		return train_id;
	}

	public void setTrain_id(int train_id) {
		this.train_id = train_id;
	}

	public String getTrain_number() {
		return train_number;
	}
	public void setTrain_number(String train_number) {
		this.train_number = train_number;
	}
	public String getTrain_name() {
		return train_name;
	}
	public void setTrain_name(String train_name) {
		this.train_name = train_name;
	}
	public String getTrain_departure() {
		return train_departure;
	}
	public void setTrain_departure(String train_departure) {
		this.train_departure = train_departure;
	}
	public String getTrain_arrival() {
		return train_arrival;
	}
	public void setTrain_arrival(String train_arrival) {
		this.train_arrival = train_arrival;
	}
	public String getTrain_depDate() {
		return train_depDate;
	}
	public void setTrain_depDate(String train_depDate) {
		this.train_depDate = train_depDate;
	}
	public String getTrain_depTime() {
		return train_depTime;
	}
	public void setTrain_depTime(String train_depTime) {
		this.train_depTime = train_depTime;
	}
	public String getTrain_arrDate() {
		return train_arrDate;
	}
	public void setTrain_arrDate(String train_arrDate) {
		this.train_arrDate = train_arrDate;
	}
	public String getTrain_arrTime() {
		return train_arrTime;
	}
	public void setTrain_arrTime(String train_arrTime) {
		this.train_arrTime = train_arrTime;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getPayment_code() {
		return payment_code;
	}
	public void setPayment_code(String payment_code) {
		this.payment_code = payment_code;
	}
	public String getConfirmation() {
		return confirmation;
	}
	public void setConfirmation(String confirmation) {
		this.confirmation = confirmation;
	}
    
}
