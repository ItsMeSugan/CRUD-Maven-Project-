package DAO;

import Model.Employee;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class process {

	static {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public List<Employee> getAllEmployees() throws SQLException {
		String sql = "SELECT * FROM Employees_Info";
		try (Connection c = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/employee_db?useSSL=false&serverTimezone=UTC",
				"root", "Suganjana@1405");
				PreparedStatement p = c.prepareStatement(sql);
				ResultSet rs = p.executeQuery()) {
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
		String sql = "SELECT Id FROM Employees_Info";
		try (Connection c = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/employee_db?useSSL=false&serverTimezone=UTC",
				"root", "Suganjana@1405");
				PreparedStatement p = c.prepareStatement(sql);
				ResultSet rs = p.executeQuery()) {
			List<Integer> ids = new ArrayList<>();
			while (rs.next())
				ids.add(rs.getInt("Id"));
			return ids;
		}
	}

	public void insertEmployee(Employee e) throws SQLException {
		String sql = "INSERT INTO Employees_Info (first_Name, last_Name, phone_Number, Age, Join_Date) VALUES (?,?,?,?,?)";
		try (Connection c = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/employee_db?useSSL=false&serverTimezone=UTC",
				"root", "Suganjana@1405");
				PreparedStatement p = c.prepareStatement(sql)) {
			p.setString(1, e.getFirstName());
			p.setString(2, e.getLastName());
			p.setString(3, e.getPhoneNumber());
			p.setInt(4, e.getAge());
			p.setDate(5, e.getJoinDate());
			p.executeUpdate();
		}
	}

	public void deleteById(int id) throws SQLException {
		String sql = "DELETE FROM Employees_Info WHERE Id = ?";
		try (Connection c = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/employee_db?useSSL=false&serverTimezone=UTC",
				"root", "Suganjana@1405");
				PreparedStatement p = c.prepareStatement(sql)) {
			p.setInt(1, id);
			p.executeUpdate();
		}
	}

	public int updateById(int id, Employee updates) throws SQLException {
	    // Start with base SQL
	    String sql = "UPDATE Employees_Info SET ";
	    List<String> columns = new ArrayList<>();
	    List<Object> values = new ArrayList<>();

	    // Collect only fields that have values
	    if (updates.getFirstName() != null) {
	        columns.add("first_Name=?");
	        values.add(updates.getFirstName());
	    }
	    if (updates.getLastName() != null) {
	        columns.add("last_Name=?");
	        values.add(updates.getLastName());
	    }
	    if (updates.getPhoneNumber() != null) {
	        columns.add("phone_Number=?");
	        values.add(updates.getPhoneNumber());
	    }
	    if (updates.getAge() != 0) {  // ⚠️ Better to use Integer instead of int
	        columns.add("Age=?");
	        values.add(updates.getAge());
	    }
	    if (updates.getJoinDate() != null) {
	        columns.add("Join_Date=?");
	        values.add(updates.getJoinDate());
	    }

	    // If nothing to update, just exit
	    if (columns.isEmpty()) {
	        return 0;
	    }

	    // Build the SQL string like "UPDATE Employees_Info SET col1=?, col2=? WHERE Id=?"
	    sql += String.join(", ", columns) + " WHERE Id=?";
	    values.add(id); // last parameter is always the id

	    // Now execute
	    try (Connection conn = DriverManager.getConnection(
	                "jdbc:mysql://localhost:3306/employee_db?useSSL=false&serverTimezone=UTC",
	                "root", "Suganjana@1405");
	         PreparedStatement stmt = conn.prepareStatement(sql)) {

	        // Fill the ? placeholders with actual values
	        for (int i = 0; i < values.size(); i++) {
	            stmt.setObject(i + 1, values.get(i));
	        }

	        // Execute update and return how many rows got updated
	        return stmt.executeUpdate();
	    }

	}
}
