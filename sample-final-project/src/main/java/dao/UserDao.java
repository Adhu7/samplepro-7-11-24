package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import bean.UserBean;
import db.ArtDB;

public class UserDao {
	public void insertUsers(UserBean user) throws SQLException {
		String query = "INSERT INTO userreg(name, phone, email, password) VALUES(?,?,?,?)";
		try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
			pst.setString(1, user.getName());
			pst.setString(2, user.getPhone());
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getPassword());
			pst.executeUpdate();
		}
	}

	public boolean isEmailExists(String Email) throws SQLException {
		String query = "SELECT * FROM userReg WHERE email=?";
		try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
			pst.setString(1, Email);
			try (ResultSet rs = pst.executeQuery()) {
				return rs.next();

			}
		}

	}

	public UserBean getUsers(int userId) throws SQLException {
		String query = "SELECT * FROM userReg WHERE userId= ?";
		try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
			pst.setInt(1, userId);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				return new UserBean(rs.getInt("userId"), rs.getString("name"), rs.getString("phone"),
						rs.getString("email"), rs.getString("password"));

			}
		}
		return null;
	}

	public void updateUsers(UserBean user) throws SQLException {
		String query = "UPDATE userReg SET name= ?, phone= ?, email= ?, password= ? WHERE id= ? ";
		try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
			pst.setString(1, user.getName());
			pst.setString(2, user.getPhone());
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getPassword());
			pst.setInt(5, user.getUserId());
			pst.executeUpdate();
		}
	}

	public void deleteUsers(int userId) throws SQLException {
		String query = "DELETE FROM users WHERE id= ?";
		try (Connection con = ArtDB.getConnection(); PreparedStatement pst = con.prepareStatement(query)) {
			pst.setInt(1, userId);
			pst.executeUpdate();
		}
	}

	public List<UserBean> getAllUsers() throws SQLException {
		List<UserBean> user = new ArrayList<UserBean>();
		String query = "SELECT * FROM userReg";
		try (Connection con = ArtDB.getConnection();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery(query)) {
			while (rs.next()) {
				user.add(new UserBean(rs.getInt("userId"), rs.getString("name"), rs.getString("phone"),
						rs.getString("email"), rs.getString("password")));
			}
		}
		return user;
	}
}
