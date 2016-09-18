##jsp 语法
###一.脚本程序
```java
  <%
    out.println("jsp");
  %>
```
###二.JSP声明
```java
  <%! int i = 0; %> 
  <%! int a, b, c; %> 
  <%! Circle a = new Circle(2.0); %> 
```
###三.JSP表达式
```java
  <%= 
    (new java.util.Date()).toLocaleString()
  %>
```
###四.JSP注释
```java
  <%-- 该部分注释在网页中不会被显示--%> 
```
###五.JSP指令
```java
  %@include file="test.jsp"%>
```
###六.JSP行为
```
  <jsp:useBean id="p1" class="lee.Person" scope="page">
  	<!-- 设置p1的name属性值 -->
  	<jsp:setProperty name="p1" property="name" value="wawa"/>
  	<!-- 设置p1的age属性值 -->
  	<jsp:setProperty name="p1" property="age" value="23"/>
  	<!-- 输出p1的name属性值 -->
  	<jsp:getProperty name="p1" property="name"/><br/>
  	<!-- 输出p1的age属性值 -->
  	<jsp:getProperty name="p1" property="age"/>
  </jsp:useBean>
```
