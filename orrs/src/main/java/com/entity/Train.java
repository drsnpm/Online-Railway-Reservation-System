package com.entity;

public class Train {
    private int id;
    private String number;
    private String name;
    private String departure;
    private String arrival;
    private String depDate;
    private String depTime;
    private String arrDate;
    private String arrTime;
    private int seats; 
    private double amount;

    public Train() {
        super();
    }

    public Train(int id, String number, String name, String departure, String arrival, String depDate, String depTime,
                 String arrDate, String arrTime, int seats, double amount) {
        super();
        this.id = id;
        this.number = number;
        this.name = name;
        this.departure = departure;
        this.arrival = arrival;
        this.depDate = depDate;
        this.depTime = depTime;
        this.arrDate = arrDate;
        this.arrTime = arrTime;
        this.seats = seats;
        this.amount = amount;
    }
    
    public Train(String number, String name, String departure, String arrival, String depDate, String depTime,
            String arrDate, String arrTime, int seats, double amount) {
	   super();
	   this.number = number;
	   this.name = name;
	   this.departure = departure;
	   this.arrival = arrival;
	   this.depDate = depDate;
	   this.depTime = depTime;
	   this.arrDate = arrDate;
	   this.arrTime = arrTime;
	   this.seats = seats;
	   this.amount = amount;
	}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public String getArrival() {
        return arrival;
    }

    public void setArrival(String arrival) {
        this.arrival = arrival;
    }

    public String getDepDate() {
        return depDate;
    }

    public void setDepDate(String depDate) {
        this.depDate = depDate;
    }

    public String getDepTime() {
        return depTime;
    }

    public void setDepTime(String depTime) {
        this.depTime = depTime;
    }

    public String getArrDate() {
        return arrDate;
    }

    public void setArrDate(String arrDate) {
        this.arrDate = arrDate;
    }

    public String getArrTime() {
        return arrTime;
    }

    public void setArrTime(String arrTime) {
        this.arrTime = arrTime;
    }

    public int getSeats() {
        return seats;
    }

    public void setSeats(int seats) {
        this.seats = seats;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) { 
        this.amount = amount;
    }
}
