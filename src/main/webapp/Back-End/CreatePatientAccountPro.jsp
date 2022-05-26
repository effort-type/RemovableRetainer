<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.sql.*"  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Patient AccountPro</title>
</head>
<body>
	<%
	// post 전송 데이터 한글 처리
	request.setCharacterEncoding("UTF-8");
	
	
	
	// JVM 메모리에 클래스 파일 업로드
	Class.forName("com.mysql.jdbc.Driver");
	// DB연결
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
	// SQL문 저장하고 실행하기 위한 객체 생성
	Statement stmt = conn.createStatement();
	// 쿼리 실행, SQL문 SELECT 실행	
	ResultSet rs = stmt.executeQuery("SELECT id, ssn FROM test");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pw_ch = request.getParameter("pw_ch");
	String name = request.getParameter("name");
	String ssn = request.getParameter("ssn");
	
	int idCheck = 0;
	int pwCheck = 0;
	int ssnCheck = 0;
	
	//패스워드 일치하는지 확인
	if(!pw.equals(pw_ch)) {
		pwCheck++;
	}
	
	//다음 레코드가 존재하면
	while(rs.next()) {
		//아이디 중복 있는지 확인
		if(rs.getString("id").equals(id)) {
			idCheck++;
			break;
		}
		//주민번호 중복 있는지 확인 -> 등록된 환자 있는지 확인
		else if(rs.getString("ssn").equals(ssn)) {
			ssnCheck++;
			break;
		}
	}
	
	//아이디랑 주민번호 둘다 중복시
	if(idCheck == 0 && ssnCheck == 0) {
		
	        String sql_insert = "INSERT INTO test(id, pw, name, ssn) VALUES";
			sql_insert += "('" + id + "', '" + pw + "', '" + name + "', '" + ssn + "')";
			
			int count = stmt.executeUpdate(sql_insert);
			if(count == 1) {
				
				%>
				<script>
					alert("환자 계정 생성완료");
					location.href = "../Front-End/tables.jsp"
				</script>
				<%
			}
            
	}
	//패스워드 불일치
	else if (pwCheck != 0) {
		%>
        <script>
            alert("패스워드가 일치하지 않습니다.");
            location.href = "../Front-End/CreatePatientAccount.jsp"
        </script>
        <%
	}
	//주민번호 중복 -> 이미 등록된 환자
	else if (ssnCheck != 0) {
		%>
        <script>
            alert("이미 존재하는 환자계정입니다.");
            location.href = "../Front-End/CreatePatientAccount.jsp"
        </script>
        <%
	}
	//나머지 경우 -> 이미 존재하는 아이디(아이디 중복)
	else {
		%>
        <script>
            alert("이미 존재하는 아이디입니다.");
            location.href = "../Front-End/CreatePatientAccount.jsp"
        </script>
        <%
        
        
	}
	
	rs.close();
	stmt.close();
	conn.close();
	
	%>
</body>
</html>