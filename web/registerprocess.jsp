<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%try{

String username=request.getParameter("username");
String userpass=request.getParameter("userpass");
String category=request.getParameter("category");
String email=request.getParameter("email");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","root");
PreparedStatement ps=con.prepareStatement("insert into quizregister values(?,?,?,?)");
ps.setString(1,username);
ps.setString(2,userpass);
ps.setString(3,category);
ps.setString(4,email);
int s=ps.executeUpdate();
System.out.print(s);
}catch(SQLException e2){
e2.printStackTrace();
}
%>
<jsp:forward page="index.jsp"></jsp:forward>
