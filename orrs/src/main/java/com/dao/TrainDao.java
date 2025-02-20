package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Train;

public class TrainDao {
    private Connection conn;

    public TrainDao(Connection conn) {
        this.conn = conn;
    }

    public List<Train> getAllTrain() {
        List<Train> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM train ORDER BY departure_date ASC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Train t = new Train();
                t.setId(rs.getInt(1));
                t.setNumber(rs.getString(2));
                t.setName(rs.getString(3));
                t.setDeparture(rs.getString(4));
                t.setArrival(rs.getString(5));
                t.setDepDate(rs.getString(6));
                t.setDepTime(rs.getString(7));
                t.setArrDate(rs.getString(8));
                t.setArrTime(rs.getString(9));
                t.setSeats(rs.getInt(10));
                t.setAmount(rs.getDouble(11));

                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Train getTrainById(int id) {
        Train t = null;
        try {
            String sql = "SELECT * FROM train WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                t = new Train();
                t.setId(rs.getInt(1));
                t.setNumber(rs.getString(2));
                t.setName(rs.getString(3));
                t.setDeparture(rs.getString(4));
                t.setArrival(rs.getString(5));
                t.setDepDate(rs.getString(6));
                t.setDepTime(rs.getString(7));
                t.setArrDate(rs.getString(8));
                t.setArrTime(rs.getString(9));
                t.setSeats(rs.getInt(10));
                t.setAmount(rs.getDouble(11));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }

    public boolean updateTrain(Train t) {
        try {
            String sql = "UPDATE train SET number=?, name=?, departure=?, arrival=?, departure_date=?, departure_time=?, arrival_date=?, arrival_time=?, seats_available=?, amount=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, t.getNumber());
            ps.setString(2, t.getName());
            ps.setString(3, t.getDeparture());
            ps.setString(4, t.getArrival());
            ps.setString(5, t.getDepDate());
            ps.setString(6, t.getDepTime());
            ps.setString(7, t.getArrDate());
            ps.setString(8, t.getArrTime());
            ps.setInt(9, t.getSeats());
            ps.setDouble(10, t.getAmount());
            ps.setInt(11, t.getId());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected == 1;
        } catch (SQLException e) {
            System.err.println("SQL Error during train update: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("Unexpected Error: " + e.getMessage());
            e.printStackTrace();
        }
        return false;
    }

    public boolean deleteTrain(int id) {
        try {
            String sql = "DELETE FROM train WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected == 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public boolean addTrain(Train t) {
        boolean f = false;
        try {
            String sql = "INSERT INTO train(number, name, departure, arrival, departure_date, departure_time, arrival_date, arrival_time, seats_available, amount) VALUES(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, t.getNumber());
            ps.setString(2, t.getName());
            ps.setString(3, t.getDeparture());
            ps.setString(4, t.getArrival());
            ps.setString(5, t.getDepDate());
            ps.setString(6, t.getDepTime());
            ps.setString(7, t.getArrDate());
            ps.setString(8, t.getArrTime());
            ps.setInt(9, t.getSeats());
            ps.setDouble(10, t.getAmount());
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    public int countTrain() {
		int i = 0;
		try {
			String sql = "select * from train";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
    public List<Train> searchTrain(String departure, String arrival, String depDate) {
        List<Train> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM train WHERE departure = ? AND arrival = ? AND departure_date = ? AND ((departure_date > CURDATE()) OR (departure_date = CURDATE() AND departure_time > CURTIME())) ORDER BY departure_date ASC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, departure);
            ps.setString(2, arrival);
            ps.setString(3, depDate);
            
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Train t = new Train();
                t.setId(rs.getInt(1));
                t.setNumber(rs.getString(2));
                t.setName(rs.getString(3));
                t.setDeparture(rs.getString(4));
                t.setArrival(rs.getString(5));
                t.setDepDate(rs.getString(6));
                t.setDepTime(rs.getString(7));
                t.setArrDate(rs.getString(8));
                t.setArrTime(rs.getString(9));
                t.setSeats(rs.getInt(10));
                t.setAmount(rs.getDouble(11));
                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public List<Train> getAvailableTrain() {
        List<Train> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM train WHERE (departure_date > CURDATE()) OR (departure_date = CURDATE() AND departure_time > CURTIME()) ORDER BY departure_date ASC, departure_time ASC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Train t = new Train();
                t.setId(rs.getInt(1));
                t.setNumber(rs.getString(2));
                t.setName(rs.getString(3));
                t.setDeparture(rs.getString(4));
                t.setArrival(rs.getString(5));
                t.setDepDate(rs.getString(6));
                t.setDepTime(rs.getString(7));
                t.setArrDate(rs.getString(8));
                t.setArrTime(rs.getString(9));
                t.setSeats(rs.getInt(10));
                t.setAmount(rs.getDouble(11));

                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}
