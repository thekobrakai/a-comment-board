<%@ page language="java" import="java.util.*" import="java.sql.*" import="com.mysql.jdbc.Driver" pageEncoding="utf-8" %>

<%
    String classForName="com.mysql.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/course_web?useUnicode=true&characterEncoding=utf-8";
    String user="root";
    String pwd="123";
    try {
        Class.forName(classForName);
        Connection con = DriverManager.getConnection(url, user, pwd);
        Statement stmt = con.createStatement();
        String sql="select * from comments;";
        ResultSet rs=stmt.executeQuery(sql);
        while(rs.next()) {
            out.println("<div class='oneComment'>");
            out.println("<div class='info'>");
            out.println("<span class='email'><a href='mailto:"+rs.getString("email")+"'>"+rs.getString("email")+"</a></span>");
            out.println("<span class='date'>"+rs.getString("time")+"</span>");
            out.println("</div>");
            out.println("<div class='detail'>");
            out.println(rs.getString("comment")+"<br/>");
            out.println("</div>");
            out.println("</div>");
        }
        rs.close();
        stmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
