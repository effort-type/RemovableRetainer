<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%     
	String hospital_id = request.getParameter("hospital_id");
	String hospital_name = request.getParameter("hospital_name");
	String head_name = request.getParameter("head_name");
	String hospital_address = request.getParameter("hospital_address");
	String hospital_phone = request.getParameter("hospital_phone");
	String business_num = request.getParameter("business_num");
	    
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection
			("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
		String sql = "update hospital set hospital_name=?,head_name=?,hospital_address=?,hospital_phone=?,business_num=?"
			+" where hospital_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, hospital_name);
		pstmt.setString(2, head_name);
		pstmt.setString(3, hospital_address);
		pstmt.setString(4, hospital_phone);
		pstmt.setString(5, business_num);
		pstmt.setString(6, hospital_id);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		}catch(ClassNotFoundException e){
			out.println(e);
		}catch(SQLException e){
			out.println(e);
		}
	response.sendRedirect("../Front-End/hospitalInfoDetail.jsp?hospital_id="+ hospital_id);
%>
</body>
</html>