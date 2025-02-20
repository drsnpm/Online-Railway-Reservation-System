package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.entity.Admin;

public class AdminDao {
	private Connection conn;

    public AdminDao(Connection conn) {
        this.conn = conn;
    }
    
    public Admin login(String email, String password) {
        Admin a = null;
        try {
            String sql = "SELECT * FROM admin WHERE email=? AND password=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                a = new Admin();
                a.setId(rs.getInt("id"));
                a.setName(rs.getString("name"));
                a.setAddress(rs.getString("address"));
                a.setDob(rs.getString("dob"));
                a.setGender(rs.getString("gender"));
                a.setPhNo(rs.getString("phone_number"));
                a.setEmail(rs.getString("email"));
                a.setPass(rs.getString("password"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return a;
    }
    
    public boolean checkOldPassword(int adminid, String oldPassword) {
		boolean f = false;

		try {
			String sql = "select * from admin where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, adminid);
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

	public boolean changePassword(int adminid, String newPassword) {
		boolean f = false;

		try {
			String sql = "update admin set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, adminid);

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
	    String sql = "SELECT * FROM admin WHERE email = ? AND id != ?";
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
	
	public boolean updateAdminProfile(Admin a) {
	    String sql = "UPDATE admin SET name=?, address=?, dob=?, gender=?, phone_number=?, email=? WHERE id=?";
	    try (PreparedStatement ps = conn.prepareStatement(sql)) {
	        ps.setString(1, a.getName());
	        ps.setString(2, a.getAddress());
	        ps.setString(3, a.getDob());
	        ps.setString(4, a.getGender());
	        ps.setString(5, a.getPhNo());
	        ps.setString(6, a.getEmail());
	        ps.setInt(7, a.getId());

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

	
	public Admin getAdminById(int id) {

		Admin a = null;
		try {

			String sql = "select * from admin where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				a = new Admin();
				a.setId(rs.getInt(1));
				a.setName(rs.getString(2));
				a.setAddress(rs.getString(3));
				a.setDob(rs.getString(4));
				a.setGender(rs.getString(5));
				a.setPhNo(rs.getString(6));
				a.setEmail(rs.getString(7));
				a.setPass(rs.getString(8));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return a;
	}
}
