<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>등록창</title>
<link rel= "stylesheet" type="text/css" href="but.css">
<style>
	*{
		font-size: 40px;
	}
</style>
</head>
<body>

<form action="save.jsp" method="post">

제목 : <input type="text" name="name"><br>
URL : <input type="text" name="url"><br>

<input type="submit" id="add_but" value="저장">

</form>

</body>
</html>