##HttpSessionListener 和 ServletContextListener 两种保存session的方法。
###HttpSessionListener的session存在于tomcat的内存中，tomcat重启后session消失（session未开启持久化）
###ServletContextListener的session存在于mysql数据库中,tomcat重启session不会消失。
##修改内容:
```java
  //httpsession默认监听session断开的时间过长，将tomcat检查断开session的时间改为5秒。
    session.setMaxInactiveInterval(5);
  //servletContextListener 的监听时间改为5秒  
    public final int MAX_MILLIS =  5 * 1000;
```
