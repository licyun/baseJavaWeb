# TagDemo, JAVA WEB自定义标签库
##一.方法说明
###1.注册标签库
```java
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
```
###2.建立对应的标签类,并重写doTag的标签方法
```java
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
```
###3.在jsp文件中声明标签，并引用标签
```java
	
	  //导入标签库
	  <%@ taglib uri="https://licyun.com/mytaglib" prefix="mytag"%>
	  //调用标签
	  <mytag:iterator collection="a" item="item">
		<tr>
			<td>${pageScope.item}</td>
		<tr>
		</mytag:iterator>
```
##二.遇到的问题
###1.解决The method of type must override a superclass method
	Windows--Preferences--Java--Compiler，在右边的Compiler compliance level 修改版本为 6.0
	项目右键->build path->configure build path->java Compiler(左边那排中) ->在右边的Compiler compliance level 修改版本为 6.0
###2.解决 The word is not correctly spelled问题
	在eclipse下的Window--Preference输入spell，然后把第一个复选框“Enable spell checking“给去掉就可以了
