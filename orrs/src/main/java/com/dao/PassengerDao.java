package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Passenger;

public class PassengerDao {
    private Connection conn;

    public PassengerDao(Connection conn) {
        this.conn = conn;
    }

    public boolean register(Passenger p) {
        boolean f = false;
        try {
            String sql = "INSERT INTO passenger(name, address, dob, gender, phone_number, email, password) VALUES(?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, p.getName());
            ps.setString(2, p.getAddress());
            ps.setString(3, p.getDob());
            ps.setString(4, p.getGender());
            ps.setString(5, p.getPhNo());
            ps.setString(6, p.getEmail());
            ps.setString(7, p.getPass());

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
    public Passenger login(String email, String password) {
        Passenger p = null;
        try {
            String sql = "SELECT * FROM passenger WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p = new Passenger();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setAddress(rs.getString("address"));
                p.setDob(rs.getString("dob"));
                p.setGender(rs.getString("gender"));
                p.setPhNo(rs.getString("phone_number"));
                p.setEmail(rs.getString("email"));
                p.setPass(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }
    
    public boolean checkOldPassword(int passid, String oldPassword) {
		boolean f = false;

		try {
			String sql = "select * from passenger where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, passid);
			ps.setString(2, oldPassword);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean changePassword(int passid, String newPassword) {
		boolean f = false;

		try {
			String sql = "update passenger set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, passid);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public boolean checkEmailExists(String email, int passId) {
	    String sql = "SELECT * FROM passenger WHERE email = ? AND id != ?";
	    try (PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, email);
	        ps.setInt(2, passId);

	        try (ResultSet rs = ps.executeQuery()) {
	            return rs.next();
	        }
	    } catch (Exception e) {
	        System.err.println("Error checking email existence: " + e.getMessage());
	        e.printStackTrace();
	    }
	    return false;
	}
	
	public boolean updatePassengerProfile(Passenger p) {
	    String sql = "UPDATE passenger SET name=?, address=?, dob=?, gender=?, phone_number=?, email=? WHERE id=?";
	    try (PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, p.getName());
	        ps.setString(2, p.getAddress());
	        ps.setString(3, p.getDob());
	        ps.setString(4, p.getGender());
	        ps.setString(5, p.getPhNo());
	        ps.setString(6, p.getEmail());
	        ps.setInt(7, p.getId());

	        int rowsAffected = ps.executeUpdate();
	        return rowsAffected == 1;
	    } catch (SQLException e) {
	        System.err.println("SQL Error during profile update: " + e.getMessage());
	        e.printStackTrace();
	    } catch (Exception e) {
	        System.err.println("Unexpected Error: " + e.getMessage());
	        e.printStackTrace();
	    }

	    return false;
	}

	
	public Passenger getPassengerById(int id) {

		Passenger p = null;
		try {

			String sql = "select * from passenger where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				p = new Passenger();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setAddress(rs.getString(3));
				p.setDob(rs.getString(4));
				p.setGender(rs.getString(5));
				p.setPhNo(rs.getString(6));
				p.setEmail(rs.getString(7));
				p.setPass(rs.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return p;
	}
	
	public List<Passenger> getAllPassenger() {
		List<Passenger> list = new ArrayList<Passenger>();
		Passenger p = null;
		try {

			String sql = "select * from passenger order by id desc";
			PreparedStatement ps = conn.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				p = new Passenger();
				p.setId(rs.getInt(1));
				p.setName(rs.getString(2));
				p.setAddress(rs.getString(3));
				p.setDob(rs.getString(4));
				p.setGender(rs.getString(5));
				p.setPhNo(rs.getString(6));
				p.setEmail(rs.getString(7));
				p.setPass(rs.getString(8));
				list.add(p);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean deletePassenger(int id) {
		boolean f = false;
		try {
			String sql = "delete from passenger where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	public int countPassenger() {
		int i = 0;
		try {
			String sql = "select * from passenger";
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

}
