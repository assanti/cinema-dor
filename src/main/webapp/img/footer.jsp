<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%!
    String copyRight = "&copy; Desenvolupat per PixelBit SA";

%>
	<br><br>
	<hr></hr>

	<c:set var="avui" value="<%=new java.util.Date()%>" />
        	<p class="ml-4">Avui:<c:out value="${calendar}"/></p>
        	
        <footer ><p class="ml-4"><b><%=copyRight %></b></p></footer>
    	<br>
    	<hr>
    </body>
	</html>
