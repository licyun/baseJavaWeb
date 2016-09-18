# filter转发和urlRewrite重定向
##两种方法的区别在于filter转发改变路径，urlRewrite重定向不改变路径。
###1.filter
```java
  //1.1@Web配置
  @WebFilter(filterName="authority"
	, urlPatterns={"/*"}
	, initParams={
		@WebInitParam(name="encoding", value="GBK"),
		@WebInitParam(name="loginPage", value="/login.jsp"),
		@WebInitParam(name="proLogin", value="/proLogin.jsp")})
  //1.2web.xml配置（等同于上面的@Web配置，只写一种即可）
  <!-- 定义Filter -->
	<filter>
		<!-- Filter的名字 -->
		<filter-name>authority</filter-name>
		<!-- Filter的实现类 -->
		<filter-class>lee.AuthorityFilter</filter-class>
		<!-- 下面三个init-param元素配置了三个参数 -->
		<init-param>
			<param-name>encoding</param-name>
			<param-value>GBK</param-value>
		</init-param>
		<init-param>
			<param-name>loginPage</param-name>
			<param-value>/login.jsp</param-value>
		</init-param>
		<init-param>
			<param-name>proLogin</param-name>
			<param-value>/proLogin.jsp</param-value>
		</init-param>
	</filter>
	<!-- 定义Filter拦截的URL地址 -->
	<filter-mapping>
		<!-- Filter的名字 -->
		<filter-name>authority</filter-name>
		<!-- Filter负责拦截的URL -->
		<url-pattern>/*</url-pattern>
	</filter-mapping>
	
	//2.实现Filter接口的doFilter方法中的Dispatcher方法来转发请求
        request.getRequestDispatcher(loginPage)
			.forward(request, response);

	
```
###2.urlRewrite
```java
  //web.xml
  <urlrewrite>
  	<rule>
  		<!-- 所有配置如下正则表达式的请求 -->
  		<from>/userinf-(\w*).html</from>
  		<!-- 将被forward到如下JSP页面，其中$1代表
  			上面第一个正则表达式所匹配的字符串 -->
  		<to type="forward">/userinf.jsp?username=$1</to>
  	</rule>
  </urlrewrite>
```
  
