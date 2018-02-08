<%--
  Created by IntelliJ IDEA.
  User: 我
  Date: 2017/9/20
  Time: 20:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="pages/sys/kj/user/adduser_info.jsp">发布成功</a>，10秒后自动跳转到发布页面！

           <script>
			 function ok(){
			    window.parent.parent.location.href="list";
			 }
			 window.setTimeout("ok();",100);
			 
			</script>

</body>
</html>
