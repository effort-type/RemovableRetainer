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
	// post ���� ������ �ѱ� ó��
	request.setCharacterEncoding("UTF-8");
	
	
	
	// JVM �޸𸮿� Ŭ���� ���� ���ε�
	Class.forName("com.mysql.jdbc.Driver");
	// DB����
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/info?serverTimezone=UTC", "root", "1234");
	// SQL�� �����ϰ� �����ϱ� ���� ��ü ����
	Statement stmt = conn.createStatement();
	// ���� ����, SQL�� SELECT ����	
	ResultSet rs = stmt.executeQuery("SELECT id, ssn FROM test");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pw_ch = request.getParameter("pw_ch");
	String name = request.getParameter("name");
	String ssn = request.getParameter("ssn");
	
	int idCheck = 0;
	int pwCheck = 0;
	int ssnCheck = 0;
	
	//�н����� ��ġ�ϴ��� Ȯ��
	if(!pw.equals(pw_ch)) {
		pwCheck++;
	}
	
	//���� ���ڵ尡 �����ϸ�
	while(rs.next()) {
		//���̵� �ߺ� �ִ��� Ȯ��
		if(rs.getString("id").equals(id)) {
			idCheck++;
			break;
		}
		//�ֹι�ȣ �ߺ� �ִ��� Ȯ�� -> ��ϵ� ȯ�� �ִ��� Ȯ��
		else if(rs.getString("ssn").equals(ssn)) {
			ssnCheck++;
			break;
		}
	}
	
	//���̵�� �ֹι�ȣ �Ѵ� �ߺ���
	if(idCheck == 0 && ssnCheck == 0) {
		
	        String sql_insert = "INSERT INTO test(id, pw, name, ssn) VALUES";
			sql_insert += "('" + id + "', '" + pw + "', '" + name + "', '" + ssn + "')";
			
			int count = stmt.executeUpdate(sql_insert);
			if(count == 1) {
				
				%>
				<script>
					alert("ȯ�� ���� �����Ϸ�");
					location.href = "../Front-End/tables.jsp"
				</script>
				<%
			}
            
	}
	//�н����� ����ġ
	else if (pwCheck != 0) {
		%>
        <script>
            alert("�н����尡 ��ġ���� �ʽ��ϴ�.");
            location.href = "../Front-End/CreatePatientAccount.jsp"
        </script>
        <%
	}
	//�ֹι�ȣ �ߺ� -> �̹� ��ϵ� ȯ��
	else if (ssnCheck != 0) {
		%>
        <script>
            alert("�̹� �����ϴ� ȯ�ڰ����Դϴ�.");
            location.href = "../Front-End/CreatePatientAccount.jsp"
        </script>
        <%
	}
	//������ ��� -> �̹� �����ϴ� ���̵�(���̵� �ߺ�)
	else {
		%>
        <script>
            alert("�̹� �����ϴ� ���̵��Դϴ�.");
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