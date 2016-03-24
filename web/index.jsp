<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title></title>
  </head>
  <body>
  <jsp:useBean id="user" class="emall.entity.User" scope="request"/>
  <form:form action="/profile/register" method="post" modelAttribute="user">
      username:<form:input path="username"/><form:errors path="username"/><br/>
      age:     <form:input path="age"/><form:errors path="age"/><br/>
      password:<form:input path="password" type="password"/><form:errors path="password"/><br/>
      email:   <form:input path="email"/><form:errors path="email"/><br/>
      telephone: <form:input path="telephone"/><form:errors path="telephone"/><br/>
      male <input type="radio" name="gender" value="male"/> female <input type="radio" name="gender" value="female"/><br/>
      <input type="submit" value="register"/>
  </form:form>

  <a href="/user/test">test</a>
  </body>
</html>
