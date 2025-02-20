package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.entity.Passenger;
import com.entity.Ticket;
import com.entity.Train;

public class TicketDao {

    private Connection conn;

    public TicketDao(Connection conn) {
        this.conn = conn;
    }

    public boolean addTicket(Ticket t) {
        boolean f = false;
        try {
            conn.setAutoCommit(false);
            String sql = "INSERT INTO ticket(pass_id, pass_name, pass_phno, train_id, train_no, train_name, train_dep, train_arr, train_dep_date, train_dep_time, train_arr_date, train_arr_time, amount, payment_code, confirmation) "
                    + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, t.getPass_id());
            ps.setString(2, t.getPass_name());
            ps.setString(3, t.getPass_phno());
            ps.setInt(4, t.getTrain_id());
            ps.setString(5, t.getTrain_number());
            ps.setString(6, t.getTrain_name());
            ps.setString(7, t.getTrain_departure());
            ps.setString(8, t.getTrain_arrival());
            ps.setString(9, t.getTrain_depDate());
            ps.setString(10, t.getTrain_depTime());
            ps.setString(11, t.getTrain_arrDate());
            ps.setString(12, t.getTrain_arrTime());
            ps.setDouble(13, t.getAmount());
            ps.setString(14, t.getPayment_code());
            ps.setString(15, t.getConfirmation());

            int i = ps.executeUpdate();
            if (i == 1) {
                String updateSeatsSql = "UPDATE train SET seats_available = seats_available - 1 WHERE id = ?";
                PreparedStatement updatePs = conn.prepareStatement(updateSeatsSql);
                updatePs.setInt(1, t.getTrain_id());
                
                int updated = updatePs.executeUpdate();
                if (updated == 1) {
                    conn.commit();
                    f = true;
                } else {
                    conn.rollback();
                }
            }
        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (SQLException se) {
                se.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        return f;
    }
    
    public List<Ticket> getAllTicket() {
        List<Ticket> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM ticket ORDER BY train_dep_date ASC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Ticket t = new Ticket();
                t.setId(rs.getInt(1));
                t.setPass_id(rs.getInt(2));
                t.setPass_name(rs.getString(3));
                t.setPass_phno(rs.getString(4));
                t.setTrain_id(rs.getInt(5));
                t.setTrain_number(rs.getString(6));
                t.setTrain_name(rs.getString(7));
                t.setTrain_departure(rs.getString(8));
                t.setTrain_arrival(rs.getString(9));
                t.setTrain_depDate(rs.getString(10));
                t.setTrain_depTime(rs.getString(11));
                t.setTrain_arrDate(rs.getString(12));
                t.setTrain_arrTime(rs.getString(13));
                t.setAmount(rs.getDouble(14));
                t.setPayment_code(rs.getString(15));
                t.setConfirmation(rs.getString(16));
                
                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Ticket> getAllTicketByLoginPassenger(int passengerId) {
        List<Ticket> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM ticket WHERE pass_id=? ORDER BY train_dep_date ASC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, passengerId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Ticket t = new Ticket();
                t.setId(rs.getInt("id"));
                t.setPass_id(rs.getInt("pass_id"));
                t.setPass_name(rs.getString("pass_name"));
                t.setPass_phno(rs.getString("pass_phno"));
                t.setTrain_id(rs.getInt("train_id"));
                t.setTrain_number(rs.getString("train_no"));
                t.setTrain_name(rs.getString("train_name"));
                t.setTrain_departure(rs.getString("train_dep"));
                t.setTrain_arrival(rs.getString("train_arr"));
                t.setTrain_depDate(rs.getString("train_dep_date"));
                t.setTrain_depTime(rs.getString("train_dep_time"));
                t.setTrain_arrDate(rs.getString("train_arr_date"));
                t.setTrain_arrTime(rs.getString("train_arr_time"));
                t.setAmount(rs.getDouble("amount"));
                t.setPayment_code(rs.getString("payment_code"));
                t.setConfirmation(rs.getString("confirmation"));

                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public Ticket getTicketById(int id) {

		Ticket t = null;
		try {

			String sql = "select * from ticket where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				t = new Ticket();
                t.setId(rs.getInt(1));
                t.setPass_id(rs.getInt(2));
                t.setPass_name(rs.getString(3));
                t.setPass_phno(rs.getString(4));
                t.setTrain_id(rs.getInt(5));
                t.setTrain_number(rs.getString(6));
                t.setTrain_name(rs.getString(7));
                t.setTrain_departure(rs.getString(8));
                t.setTrain_arrival(rs.getString(9));
                t.setTrain_depDate(rs.getString(10));
                t.setTrain_depTime(rs.getString(11));
                t.setTrain_arrDate(rs.getString(12));
                t.setTrain_arrTime(rs.getString(13));
                t.setAmount(rs.getDouble(14));
                t.setPayment_code(rs.getString(15));
                t.setConfirmation(rs.getString(16));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
	}
    
    public boolean updateTicket(Ticket t) {
        try {
            String sql = "UPDATE ticket SET confirmation=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, t.getConfirmation());
            ps.setInt(2, t.getId());

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
    
    public boolean cancelTicket(int id) {
        boolean f = false;
        try {
            conn.setAutoCommit(false);
            String getTrainIdSql = "SELECT train_id FROM ticket WHERE id=?";
            PreparedStatement getTrainIdPs = conn.prepareStatement(getTrainIdSql);
            getTrainIdPs.setInt(1, id);
            ResultSet rs = getTrainIdPs.executeQuery();

            int trainId = -1;
            if (rs.next()) {
                trainId = rs.getInt("train_id");
            }

            if (trainId == -1) {
                conn.rollback();
                return false;
            }
            String deleteTicketSql = "DELETE FROM ticket WHERE id=?";
            PreparedStatement deletePs = conn.prepareStatement(deleteTicketSql);
            deletePs.setInt(1, id);
            int rowsAffected = deletePs.executeUpdate();

            if (rowsAffected == 1) {
                String updateSeatsSql = "UPDATE train SET seats_available = seats_available + 1 WHERE id=?";
                PreparedStatement updatePs = conn.prepareStatement(updateSeatsSql);
                updatePs.setInt(1, trainId);
                int updated = updatePs.executeUpdate();

                if (updated == 1) {
                    conn.commit();
                    f = true;
                } else {
                    conn.rollback();
                }
            } else {
                conn.rollback();
            }
        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (SQLException se) {
                se.printStackTrace();
            }
            e.printStackTrace();
        } finally {
            try {
                conn.setAutoCommit(true);
            } catch (SQLException se) {
                se.printStackTrace();
            }
        }
        return f;
    }
    public List<Ticket> getAllApprovedTicket() {
        List<Ticket> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM ticket where confirmation='Confirmed' ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Ticket t = new Ticket();
                t.setId(rs.getInt(1));
                t.setPass_id(rs.getInt(2));
                t.setPass_name(rs.getString(3));
                t.setPass_phno(rs.getString(4));
                t.setTrain_id(rs.getInt(5));
                t.setTrain_number(rs.getString(6));
                t.setTrain_name(rs.getString(7));
                t.setTrain_departure(rs.getString(8));
                t.setTrain_arrival(rs.getString(9));
                t.setTrain_depDate(rs.getString(10));
                t.setTrain_depTime(rs.getString(11));
                t.setTrain_arrDate(rs.getString(12));
                t.setTrain_arrTime(rs.getString(13));
                t.setAmount(rs.getDouble(14));
                t.setPayment_code(rs.getString(15));
                t.setConfirmation(rs.getString(16));
                
                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    public List<Ticket> getAllPendingTicket() {
        List<Ticket> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM ticket where confirmation='Pending' ORDER BY id DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Ticket t = new Ticket();
                t.setId(rs.getInt(1));
                t.setPass_id(rs.getInt(2));
                t.setPass_name(rs.getString(3));
                t.setPass_phno(rs.getString(4));
                t.setTrain_id(rs.getInt(5));
                t.setTrain_number(rs.getString(6));
                t.setTrain_name(rs.getString(7));
                t.setTrain_departure(rs.getString(8));
                t.setTrain_arrival(rs.getString(9));
                t.setTrain_depDate(rs.getString(10));
                t.setTrain_depTime(rs.getString(11));
                t.setTrain_arrDate(rs.getString(12));
                t.setTrain_arrTime(rs.getString(13));
                t.setAmount(rs.getDouble(14));
                t.setPayment_code(rs.getString(15));
                t.setConfirmation(rs.getString(16));
                
                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public int countTickets() {
		int i = 0;
		try {
			String sql = "select * from ticket";
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
    public int countPendingTicket() {
		int i = 0;
		try {
			String sql = "SELECT * FROM ticket where confirmation='Pending'";
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
    public int countApprovedTicket() {
		int i = 0;
		try {
			String sql = "SELECT * FROM ticket where confirmation='Confirmed'";
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
    public double countTotalTicketAmount() {
        double totalAmount = 0.0;
        try {
            String sql = "SELECT SUM(amount) FROM ticket";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                totalAmount = rs.getDouble(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalAmount;
    }
}
