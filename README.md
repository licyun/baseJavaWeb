# TagDemo
#JAVA WEB自定义标签库
```java
 1.注册标签库
   mytaglib.dtd
   <taglib xmlns="http://java.sun.com/xml/ns/j2ee"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://java.sun.com/xml/ns/j2ee web-jsptaglibrary_2_0.xsd"
	version="2.0">
	<tlib-version>1.0</tlib-version>
	<short-name>mytaglib</short-name>
	<!-- 定义该标签库的URI -->
	<uri>https://licyun.com/mytaglib</uri>

	<!-- 定义第一个标签 -->
	<tag>
		<!-- 定义标签名 -->
		<name>iterator</name>
		<!-- 定义标签处理类 -->
		<tag-class>lee.IteratorTag</tag-class>
		<!-- 定义标签体不允许出现JSP脚本 -->
		<body-content>scriptless</body-content>
		<!-- 配置标签属性:collection -->
		<attribute>
			<name>collection</name> 
			<required>true</required>
			<fragment>true</fragment>
		</attribute>
		<!-- 配置标签属性:item -->
		<attribute>
			<name>item</name> 
			<required>true</required>
			<fragment>true</fragment>
		</attribute>
	</tag>
	2.建立对应的标签类,并重写doTag的标签方法
	public class IteratorTag extends SimpleTagSupport
	
	public void doTag() throws JspException, IOException
	{
		//从page scope中获取属性名为collection的集合
		Collection itemList = (Collection)getJspContext().
			getAttribute(collection);
		//遍历集合
		for (Object s : itemList)
		{
			//将集合的元素设置到page 范围
			getJspContext().setAttribute(item, s );
			//输出标签体
			getJspBody().invoke(null);
		}
	}
	3.在jsp文件中声明标签，并引用标签
	  //导入标签库
	  <%@ taglib uri="https://licyun.com/mytaglib" prefix="mytag"%>
	  //调用标签
	  <mytag:iterator collection="a" item="item">
		<tr>
			<td>${pageScope.item}</td>
		<tr>
		</mytag:iterator>
```
