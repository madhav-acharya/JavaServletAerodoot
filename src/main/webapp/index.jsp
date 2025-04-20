<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>AeroDoot</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/styles.css">
</head>
<body>

<jsp:include page="WEB-INF/includes/navbar.jsp"/>

  <!-- Main Content Area (Placeholder) -->
  <main class="main-content">
    <div class="container">
      <h1>Welcome to AeroDoot</h1>
      <p>Your trusted partner for air travel management. Fly with confidence, manage with ease.</p>
    </div>
  </main>


<%-- Include Navbar --%>
  <jsp:include page="WEB-INF/includes/footer.jsp"/>
<%--  <jsp:include page="WEB-INF/view/signup.jsp" />--%>
</body>
</html>