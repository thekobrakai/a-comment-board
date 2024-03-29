<%@ page language="java" import="java.util.*" import="java.sql.*" import="com.mysql.jdbc.Driver" pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Comment Board</title>
        <meta http-equiv="content-type" content="text/html;charset=utf-8"/>
        <link type="text/css" rel="stylesheet" href="../stylesheet/stylesheet.css"/>
        <script type="text/javascript" src="../javascript/main.js"></script>
    </head>
    
    <body onload="init()">
        <div class="header">
            <h1>Leave Comments</h1>
        </div>
        <div class="wrap">
            <form method="post" action="add_comment.jsp" onsubmit="return checkform()">
                email:&nbsp;&nbsp;<input type="text" name="email" class="email" onfocus="focusEmailInput()" onblur="leaveEmailInput()"/> &nbsp;*&nbsp;You must input your email address first.
                <br/>
                <textarea class="comment" name="comment" wrap="virtual" onfocus="focusTextArea()" onblur="leaveTextArea()">Input your comment here...</textarea>
                <input type="submit" name="submit" value="submit" class="submit"/>
            </form>

            <div class="commentsboard">
                <h2>All comments here</h2>
                <jsp:include page="show_comments.jsp"/>

                <div id="seeall">
                    <a href="javascript:;" onclick="seeAllComments()">See all comments</a>
                </div>
                <div id="hide">
                    <a href="javascript:;" onclick="init()">Hide</a>
                </div>
            </div>
        </div>
        <div class="footer">
            By: Guo Ang<br/>
            <a href="mailto:guoang.sysu@gmail.com">guoang.sysu@gmail.com</a>
        </div>
    </body>
</html>
