<%--
��վ: <a href="http://www.crazyit.org">���Java����</a>
author  yeeku.H.lee kongyeeku@163.com
version  1.0
Copyright (C), 2001-2012, yeeku.H.Lee
This program is protected by copyright laws.
Program Name:
Date: 
--%>

<%@ page contentType="text/html; charset=GBK" language="java" errorPage="" %>
<!-- �����ǩ�⣬ָ��mytagǰ׺�ı�ǩ��
	��http://www.crazyit.org/mytaglib�ı�ǩ�⴦�� -->
<%@ taglib uri="https://licyun.com/mytaglib" prefix="mytag"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>�Զ����ǩʾ��</title>
	<meta name="website" content="http://www.crazyit.org" />
</head>
<body bgcolor="#ffffc0">
<h2>������ʾ���ǲ�ѯ��ǩ�Ľ��</h2>
<!-- ʹ�ñ�ǩ ������mytag�Ǳ�ǩǰ׺������taglib�ı���ָ�
	mytagǰ׺����http://www.crazyit.org/mytaglib�ı�ǩ�⴦�� -->
<mytag:query
	driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/javaee"
	user="root"
	pass="123456"
	sql="select * from user_table;"/><br/>
</body>
</html>