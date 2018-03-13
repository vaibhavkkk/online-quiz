<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="org.omg.CORBA.PUBLIC_MEMBER"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
String username=request.getParameter("username");
System.out.print(username);
String userpass=request.getParameter("userpass");
String category=request.getParameter("category");

boolean status=false;
try{
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","root");
PreparedStatement ps=con.prepareStatement("select * from quizregister where username=? and userpass=? and category=?");
ps.setString(1,username);
ps.setString(2,userpass);
ps.setString(3,category);
ResultSet rs=ps.executeQuery();
if(rs==null){
	System.out.print("You are from a different category please login by choosing your category.");
}
status=rs.next();
if(status){
System.out.print("hi");
username=rs.getString(1);
session.setAttribute("username",String.valueOf(username));
session.setAttribute("islogin","plz sign in first");
session.setAttribute("category",category);
%>
<jsp:forward page="home.jsp"></jsp:forward>
<%
}
else{
System.out.print("hi");
request.setAttribute("Error","Sorry! Username or Password or Category Error. plz Enter Correct Detail or Register");
session.setAttribute("Loginmsg","plz sign in first");
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
}
}

catch(Exception e){
e.printStackTrace();
}

%>


