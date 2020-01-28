<%@page import="java.time.LocalDate"%>


<%@include file="../header.jsp"%>

  

  <div class="container mt-5">
  
  <p>Default credentials: &nbsp;&nbsp;<span class="text-black-50 bg-dark"> admin/admin</span></p>
	<form name="frmLogin" method="post" action="/cinema/action-login">
		<p>
			<label>User:</label>
			<input class="ml-6" name="usuName" type="text" value="" required="required" />
		</p>
		<p>
			<label>Password:</label>
			<input name="usuPass" type="password" value="" required="required" />
		</p>
		<button class="mb-4 btn btn-outline-primary "type="submit">Entrar</button>		
	</form>
	</div>
	
<%@include file="../footer.jsp" %>