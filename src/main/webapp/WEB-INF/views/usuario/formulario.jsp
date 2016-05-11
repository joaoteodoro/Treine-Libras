<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h3>Adicionar Usuario</h3>
	<form action="adicionaUsuario" method="post">
		Nome: <input type="text" name="nome" id="nome">
		Email: <input type="text" name="email" id="email">
		Usuario: <input type="text" name="usuario" id="usuario">
		Senha: <input type="text" name="senha" id="senha">
		Perfil: <input type="text" name="perfil" id="perfil">
		<input type="submit" value="Adicionar">
	</form>
</body>
</html>