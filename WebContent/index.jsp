<%@ page import="java.sql.*"%> 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 
  
<%
		String s = request.getParameter("val");

		if (s == null || s.trim().equals("") ) {
			out.print("Please enter vaild Dept No");
		} else {
			int id = Integer.parseInt(s);
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysqljdbc", "root",
						"Yahoo@321");
				PreparedStatement ps = con.prepareStatement("select * from candidates where id=?");
				ps.setInt(1, id);
				ResultSet rs = ps.executeQuery();
				while (rs.next()) {
					out.print(rs.getInt(1) + ", " + rs.getString(2));
				}
				con.close();
			} catch (Exception e) {
				out.print("error"+e.getMessage());
				e.printStackTrace();
			}
		}
	%>
</body>
</html>