# Online Railway Reservation System

## Overview
This module allows passengers to register, log in, manage their profiles, search for trains, book tickets, and cancel reservations. Additionally, the system enables passengers to modify their tickets and view their travel history. Admins have full control over managing passengers, tickets, train schedules, and reservations within the Online Railway Reservation System (ORRS).

## Tools Used
- Eclipse IDE
- MySQL Workbench
- Java
- JDBC
- Servlet
- Bootstrap

## Tech Stack
- **Frontend**: HTML, CSS, JavaScript
- **Backend**: Java (Servlets), JDBC
- **Database**: MySQL
- **Server**: Apache Tomcat

## Installation

### Prerequisites
Make sure you have the following software installed:
- [Java JDK](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html)
- [Apache Tomcat](https://tomcat.apache.org/)
- [MySQL](https://www.mysql.com/)
- [JDBC Driver for MySQL](https://dev.mysql.com/downloads/connector/j/)
- [Eclipse IDE](https://www.eclipse.org/downloads/) or any IDE supporting Java Servlets

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/drsnpm/online-railway-reservation-system.git

2. Configure the database in `DBConnect.java` and update `web.xml`.

3. Compile and run the server using Apache Tomcat:
   ```bash
   javac -cp .;path-to-mysql-connector.jar *.java
   ```

4. Deploy the WAR file in Tomcat's `webapps` directory.

5. Start the Tomcat server and access the application at:
   ```
   http://localhost:8080/hms
   ```

6. Open the application in your browser and start using the patient, doctor, and admin modules!

## Features for Passenger
1. **Passenger Registration** - New passengers can register using their credentials. Email verification for added security.
2. **Passenger Login & Authentication** - Secure login system with username and password for authenticated access.  
3. **Profile Management** - Passengers can view and update their personal details, including contact information and travel preferences.  
4. **Change Password** - Secure password change option with old password verification for added security.  
5. **Search Available Trains** - Passengers can search for available trains by departure arrival and departure date of train.
6. **Book Train Ticket** - Passengers can securely book tickets by selecting available trains, travel date, and seats.
7. **View Booking Details** - Passengers can view their ticket details, including train information, date, time.
8. **Cancel Booking** - Passengers can cancel their booking within the allowed timeframe.
9. **Fake Payment Simulation** - Passengers can simulate a payment for the booking process, including a fake transaction confirmation.
10. **Logout Securely** - Secure logout option to prevent unauthorized access to the passenger's account after use.

## Features for Admin
1. **Admin Login** - Secure authentication process for admin access.
2. **Manage Passengers** - Admin can add, update or delete passenger profiles.
3. **Manage Tickets** - Admin can view, issue and delete tickets based on reservations.
4. **Approve or Reject Tickets** - Admin can pprove or **reject pending ticket requests.
5. **View Reservations** - Admin can view all reservations made by passengers.
6. **Fare Management** – Set and update ticket prices based on demand, season, or policies.
7. **Manage Train Schedules** - Admin can add new trains or remove canceled services from the system.
8. **Profile Management** - Admin can update personal details and manage account settings.
9. **Change Password** - Admin can securely change their password.
10. **Secure Logout** - Admin can log out securely to prevent unauthorized access to the system.


## Snapshots
### Home Page
![Image](https://github.com/user-attachments/assets/492b1d0e-1785-4501-8dfd-3dd0f5ac8651)
### Passenger Register Page
![Image](https://github.com/user-attachments/assets/66427515-08ba-4430-a386-3d5263d72a50)
### Passenger Login Page
![Image](https://github.com/user-attachments/assets/143aaec8-37f3-44b9-9e0e-59b0e9135fdb)
### Passenger Home Page
![Image](https://github.com/user-attachments/assets/3f633538-a5da-45b4-887f-8fb1316c3491)
### Passenger Payment Page
![Image](https://github.com/user-attachments/assets/b6c60f8d-29da-4ebe-95ef-a05e3a8dac73)
### Passenger Booking History Page
![Image](https://github.com/user-attachments/assets/4e77032d-44a1-4d8d-982f-9b66e1836142)
### Passenger Ticket Details
![Image](https://github.com/user-attachments/assets/75405f36-6ee0-417b-a26e-0addfd139307)
### Passenger Profile Details
![Image](https://github.com/user-attachments/assets/304b0549-a82a-4439-ae2f-9cfd643ecf1d)
### Passenger Profile Update
![Image](https://github.com/user-attachments/assets/97bee3ab-29ec-471d-a730-9490f00d94f3)
### Admin Dashboard
![Image](https://github.com/user-attachments/assets/de4366b1-9aab-4a51-b800-607571e3543e)
### Admin Add Train
![Image](https://github.com/user-attachments/assets/68e2fd79-914a-484f-a787-1d3abcbdc44a)
### Admin Manage Train
![Image](https://github.com/user-attachments/assets/6b09abc1-5643-40f8-b658-a099194e1c56)
### Admin Update Train
![Image](https://github.com/user-attachments/assets/9aeecfe7-4930-44fd-8bbc-152d51edfe3c)
### Admin Add Passenger
![Image](https://github.com/user-attachments/assets/48f05bde-5e88-4364-8bb2-2f655aa0416d)
### Admin Manage Passenger
![Image](https://github.com/user-attachments/assets/a05c002f-a067-4b5f-9152-776c13ccaa9c)
### Admin Update Passenger
![Image](https://github.com/user-attachments/assets/afb80d11-034a-4d2d-bffa-b648cf48290d)
### Admin Manage Tickets
![Image](https://github.com/user-attachments/assets/1af022a6-bf7d-4b8c-8197-2aebe626bad7)
### Admin View Approved Tickets
![Image](https://github.com/user-attachments/assets/cfaa377b-7087-420a-a668-ecbe16dcd7a3)
### Admin View Pending Tickets
![Image](https://github.com/user-attachments/assets/2609943f-0729-4c57-b05b-2e5f68bd01f8)
### Admin Profile Details
![Image](https://github.com/user-attachments/assets/15e6600b-de4c-439c-a734-902e3eda0120)
