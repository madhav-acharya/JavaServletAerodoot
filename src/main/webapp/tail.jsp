<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    Boolean isAuthPage = (Boolean) request.getAttribute("authPage");
    if (isAuthPage == null || !isAuthPage) {
%>
    <jsp:include page="WEB-INF/includes/footer.jsp" />
<% } %>
</body>
</html>