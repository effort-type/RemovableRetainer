<!-- sessionLoginPro.jsp -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"  %>

        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>LoginPro</title>
            <%@ page import="java.util.Date"%>
        </head>

        <body>
            <%
	// post 전송 데이터 한글 처리
	request.setCharacterEncoding("UTF-8");
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
	Statement stmt = conn.createStatement();	
	ResultSet rs = null;
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String logout = request.getParameter("logout");
	
	// 아이디가 존재하는 아이디인지 아닌지 체크하는 변수
	boolean check = false;
	boolean pwCheck = false;
	
	if(logout != null) {
		session.setAttribute("user_id", null);
		session.setMaxInactiveInterval(0);
		
		check = true;
		%>
			<script>
				alert("로그아웃 되었습니다.");
				location = "../Front-End/index.html";
			</script>
		<%
	}
	else{
		char who = id.charAt(0);
	switch(who){
	case 'a':
		rs = stmt.executeQuery("SELECT admin_id, admin_pw FROM admin");
		while(rs.next() && check == false) {		
			
			if(rs.getString("admin_id").equals(id))
			{	check = true;
				if(rs.getString("admin_pw").equals(pw))
				{ pwCheck = true;
					%>
	                <script>
	                    alert("인증되었습니다.");
	                <%
		            	session.setAttribute("admin_id", id);
		            	session.setAttribute("admin_pw", pw);
		
		            	// 세션 유지 시간 설정 (30분동안 설정)
		            	session.setMaxInactiveInterval(3000);
		            	response.sendRedirect("../Front-End/hospitalInfoTab.jsp");
	                %>
	                </script>
	                <%
					break;
				}		
			}			
		} 
		rs.close();
		stmt.close();
		conn.close();
		break;
	case 'h':
		rs = stmt.executeQuery("SELECT hospital_id, hospital_pw FROM hospital");
		while(rs.next() && check == false) {		
			
			if(rs.getString("hospital_id").equals(id))
			{	check = true;
				if(rs.getString("hospital_pw").equals(pw))
				{ pwCheck = true;
					%>
	                <script>
	                    alert("인증되었습니다.");
	                <%
		            	session.setAttribute("hospital_id", id);
		            	session.setAttribute("hospital_pw", pw);
		
		            	// 세션 유지 시간 설정 (30분동안 설정)
		            	session.setMaxInactiveInterval(3000);
		            	response.sendRedirect("../Front-End/doctorInfoTab.jsp");
	                %>
	                </script>
	                <%
					break;
				}		
			}			
		} 
		rs.close();
		stmt.close();
		conn.close();
		break;
	case 'd':
		rs = stmt.executeQuery("SELECT doctor_id, doctor_pw FROM doctor");
		while(rs.next() && check == false) {		
			
			if(rs.getString("doctor_id").equals(id))
			{	check = true;
				if(rs.getString("doctor_pw").equals(pw))
				{ pwCheck = true;
					%>
	                <script>
	                    alert("인증되었습니다.");
	                <%
		            	session.setAttribute("doctor_id", id);
		            	session.setAttribute("doctor_pw", pw);
		
		            	// 세션 유지 시간 설정 (30분동안 설정)
		            	session.setMaxInactiveInterval(30);
		            	//의사덴탈케어로가는 인덱스페이지
		            	response.sendRedirect("../Front-End/index_Success.jsp");
	                %>
	                </script>
	                <%
					break;
				}		
			}			
		} 
		rs.close();
		stmt.close();
		conn.close();
		break;
	case 'p':
		rs = stmt.executeQuery("SELECT user_id, user_pw FROM user");
		while(rs.next() && check == false) {		
			
			if(rs.getString("user_id").equals(id))
			{	check = true;
				if(rs.getString("user_pw").equals(pw))
				{ pwCheck = true;
					%>
	                <script>
	                    alert("인증되었습니다.");
	                <%
		            	session.setAttribute("user_id", id);
		            	session.setAttribute("user_pw", pw);
		
		            	// 세션 유지 시간 설정 (30분동안 설정)
		            	session.setMaxInactiveInterval(30);
		            	response.sendRedirect("../Front-End/index_Success.jsp");
	                %>
	                </script>
	                <%
					break;
				}		
			}			
		} 
		rs.close();
		stmt.close();
		conn.close();
		break;
	 default :
		 break;
	}
	
		
	
	// DB에 입력 받은 id가 없다면 실행
	if(check == false)
	{		
		   %>
        <script>
             alert("존재하지 않는 아이디입니다.");
             location.href = "../Front-End/login.html"
        </script>
        <%
	}	

	if(pwCheck == false)
	{		
		%>
 		   <script>
  			  alert("비밀번호가 다릅니다.");
  			  location.href = "../Front-End/login.html"
			</script>
		<%
	}
	}
	%>
        </body>

        </html>