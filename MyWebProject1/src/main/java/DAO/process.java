package DAO;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Model.Employee;

public class process {

	private static final String DataBaseURL = "jdbc:mysql://localhost:3306/employee_db?useSSL=false&serverTimezone=UTC";
	private static final String USER = "root";
	private static final String PASSWORD = "Suganjana@1405";

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public List<Employee> getAllEmployees() throws SQLException {
		String sql = "SELECT * FROM employees_info";
		try (Connection c = DriverManager.getConnection(DataBaseURL, USER,
				PASSWORD);
				PreparedStatement ps = c.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {
			List<Employee> list = new ArrayList<>();
			while (rs.next()) {
				Employee e = new Employee();
				e.setId(rs.getInt("Id"));
				e.setFirstName(rs.getString("first_Name"));
				e.setLastName(rs.getString("last_Name"));
				e.setPhoneNumber(rs.getString("phone_Number"));
				e.setAge(rs.getInt("Age"));
				e.setJoinDate(rs.getDate("Join_Date"));
				list.add(e);
			}
			return list;
		}
	}

	public List<Integer> getAllIds() throws SQLException {

		String sql = "SELECT Id FROM employees_info";
		try (Connection c = DriverManager.getConnection(DataBaseURL, USER,
				PASSWORD);
				PreparedStatement ps = c.prepareStatement(sql);
				ResultSet rs = ps.executeQuery()) {

			List<Integer> ids = new ArrayList<>();
			while (rs.next())
				ids.add(rs.getInt("Id"));
			return ids;
		}
	}

	public void insertEmployee(Employee e) throws SQLException {

		String sql = "INSERT INTO employees_info (first_Name, last_Name, phone_Number, Age, Join_Date) value(?,?,?,?,?)";
		try(Connection c = DriverManager.getConnection(DataBaseURL, USER, PASSWORD);
				PreparedStatement ps = c.prepareStatement(sql)){
			ps.setString(1, e.getFirstName());
			ps.setString(2, e.getLastName());
			ps.setString(3, e.getPhoneNumber());
			ps.setInt(4, e.getAge());
			ps.setDate(5, e.getJoinDate());
			ps.executeUpdate();
		}
	}
}
