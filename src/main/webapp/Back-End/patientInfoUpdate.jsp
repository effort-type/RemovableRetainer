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
	String name = request.getParameter("user_name");
	String user_id = request.getParameter("user_id");
	String user_phone = request.getParameter("user_phone");
	String family_phone = request.getParameter("family_phone");
	String doctor_id = request.getParameter("doctor_id");
	String user_address = request.getParameter("user_address");
	String type = request.getParameter("device_type");
	String device_end = request.getParameter("device_end");
	
	if(type.equals("가철식 교정 유지장치")) {
		type = "D";
	}else {
		type = "F";
	}
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
		String sql = "update user set user_name=?,user_phone=?,family_phone=?,doctor_id=?,user_address=?"
			+",device_type=?,device_end=? where user_id=?";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, user_phone);
		pstmt.setString(3, family_phone);
		pstmt.setString(4, doctor_id);
		pstmt.setString(5, user_address);
		pstmt.setString(6, type);
		pstmt.setString(7, device_end);
		pstmt.setString(8, user_id);
		pstmt.executeUpdate();
		
		pstmt.close();
		conn.close();
		}catch(ClassNotFoundException e){
			out.println(e);
		}catch(SQLException e){
			out.println(e);
		}
	response.sendRedirect("../Front-End/patientInfoTab.jsp");
%>
</body>
</html>