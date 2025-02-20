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
![Image](https://github.com/user-attachments/assets/2eecd888-37a0-4b5d-9189-6959df3435ff)
### Passenger Login Page
![Image](https://github.com/user-attachments/assets/5dc3b09e-23e4-41e2-9f2e-198200ccdf36)
### Passenger Booking Page
![Image](https://github.com/user-attachments/assets/8890ad02-ee3f-46a7-912a-bd7c3c10f280)
### Passenger Payment Page
![Image](https://github.com/user-attachments/assets/7139df1f-8199-4afe-aed8-5fa959d11ebb)
### Passenger Booking History Page
![Image](https://github.com/user-attachments/assets/32b846be-0727-4ed3-94c5-57f21c6e23b8)
### Passenger Ticket Details
![Image](https://github.com/user-attachments/assets/7cef648f-3c41-4275-ae6f-ec611632cb66)
### Passenger Profile Details
![Image](https://github.com/user-attachments/assets/3ee542f8-2656-40f9-a202-4e5882a4bc55)
### Passenger Profile Update
![Image](https://github.com/user-attachments/assets/48c05d04-dc06-46ac-b752-4afbebc96a03)
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
