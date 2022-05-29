<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*"  %>


<%
	String id = (String)session.getAttribute("id");	
	session.setMaxInactiveInterval(3000);
	if(id != null) {
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Profile Correction Pro</title>
</head>
<body>
	<%
	// post ���� ������ �ѱ� ó��
	request.setCharacterEncoding("UTF-8");
	
	String nowpw = request.getParameter("nowpw");
	String corpw = request.getParameter("corpw");
	String corpwcheck = request.getParameter("corpwcheck");
	String targettime = request.getParameter("targettime");
	String phonenum = request.getParameter("phonenum");
	String protectorphonenum = request.getParameter("protectorphonenum");
	String address = request.getParameter("address");
	
	try{
		// JVM �޸𸮿� Ŭ���� ���� ���ε�
		Class.forName("com.mysql.jdbc.Driver");
		// DB����
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
		String str_Query = "SELECT * FROM test WHERE id = ?";
		//Statement stmt = conn.createStatement();
		PreparedStatement pstmt = conn.prepareStatement(str_Query);
		pstmt.setString(1, id);
		// ���� ����, SQL�� SELECT ����	
		ResultSet rs = pstmt.executeQuery();
		
		
		
		if(rs.next()) {
			if(!nowpw.equals(rs.getString("pw"))) {
				%>
		        <script>
		            alert("���� �н����尡 ��ġ���� �ʽ��ϴ�.");
		            location.href = "../Front-End/UserProfileCorrection.jsp"
		        </script>
		        <%
			}
			else if(!corpw.equals(corpwcheck)) {
				%>
		        <script>
		            alert("������ �н����尡 ��ġ���� �ʽ��ϴ�.");
		            location.href = "../Front-End/UserProfileCorrection.jsp"
		        </script>
		        <%
			}
			else if(corpw == "") {
					String sql = "UPDATE test SET targettime=?, phonenum=?, protectorphonenum=?, address=? WHERE id=?";
						
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setString(1, targettime);
					pstmt.setString(2, phonenum);
					pstmt.setString(3, protectorphonenum);
					pstmt.setString(4, address);
					pstmt.setString(5, id);
					pstmt.executeUpdate();
				%>
		        <script>
		            alert("�����Ǿ����ϴ�.");
		            location.href = "../Front-End/UserProfile.jsp"
		        </script>
		        <%
			}
			else {
				String sql = "UPDATE test SET pw=?, targettime=?, phonenum=?, protectorphonenum=?, address=? WHERE id=?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, corpw);
				pstmt.setString(2, targettime);
				pstmt.setString(3, phonenum);
				pstmt.setString(4, protectorphonenum);
				pstmt.setString(5, address);
				pstmt.setString(6, id);
				pstmt.executeUpdate();
				%>
		        <script>
		            alert("�����Ǿ����ϴ�.");
		            location.href = "../Front-End/UserProfile.jsp"
		        </script>
		        <%
			}
		}
	
	
	
	
	
	rs.close();
	pstmt.close();
	conn.close();
	}catch(ClassNotFoundException e){
		out.println(e);
	}catch(SQLException e){
		out.println(e);
	}
	%>
</body>
</html>
<%
	} else {
		%>
			<script>
				alert('�α����� �ʿ��� �������Դϴ�.');
				location = "login.html"
			</script>
<%
	}
%>