<%@ page language="java" import="java.util.*" import="java.sql.*" import="com.mysql.jdbc.Driver" pageEncoding="utf-8" %>

<%
    String classForName="com.mysql.jdbc.Driver";
    String url="jdbc:mysql://localhost:3306/course_web?useUnicode=true&characterEncoding=utf-8";
    String user="root";
    String pwd="123";
    String email= new String(request.getParameter("email").getBytes("iso8859-1"),"utf-8");
    String comment= new String(request.getParameter("comment").getBytes("iso8859-1"),"utf-8");
    for (int i = 0;i<comment.length();i++)
    {
        if(comment.charAt(i)=='\n')
            comment=comment.substring(0,i-1)+"<br/>"+comment.substring(i+1);
        if(comment.charAt(i)==' ')
            comment=comment.substring(0,i)+"&nbsp;"+comment.substring(i+1);
    }

    java.util.Date date=new java.util.Date();
    String time=date.toString();

    try {
        Class.forName(classForName);
        Connection con = DriverManager.getConnection(url, user, pwd);
        Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
        String sql="insert into comments values('"+email+"','"+comment+"','"+time+"');";
        out.println(sql);
        stmt.executeUpdate(sql);
        stmt.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<%
response.setStatus(HttpServletResponse.SC_MOVED_PERMANENTLY);
String newURL = "/index.jsp";
response.setHeader("Location",newURL);
%>
