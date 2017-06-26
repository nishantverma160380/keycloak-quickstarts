<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ page import="org.keycloak.representations.IDToken" %>
<!DOCTYPE html>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>NHS Health App</title>
    <link rel="stylesheet" type="text/css" href="styles.css"/>
</head>
<body>
<jsp:useBean id="controller" class="org.keycloak.quickstart.profilejee.Controller" scope="request"/>
<c:set var="name" value="<%=controller.getUserDetails(request)%>"/>

    <div class="wrapper">
        <div class="content">
            <div class="logo">
                <table width="100%"><tr width="100%"><td width="50%"><img src="images/nhs-logo.png" alt="NHS Logo" border="0" /></td>
                    <td width="50%" align="right"><button name="logoutBtn" onclick="location.href = 'index.jsp?logout=true'" type="button">Logout</button></td>
                </tr></table>
            </div>
            <p>&nbsp;</p>

            <h1>Welcome <%=request.getAttribute("fullName") %> to NHS Digital</h1>
            <h2>My Profile</h2>

            <p>User Name | <%=request.getAttribute("username") %> </p>
            <p>NHS Number | <%=request.getAttribute("nhsNo") %> </p>
            <p>First Name | <%=request.getAttribute("first") %> </p>
            <p>Last Name | <%=request.getAttribute("last") %> </p>
            <p>Email Address | <%=request.getAttribute("email") %> </p>
            <p>Principal ID | <%=request.getUserPrincipal().getName() %> </p>
            <p>&nbsp;</p>

        </div>
    </div>
    <div class="wrapper">
        <div class="content">
            <div class="logo">
                    <img src="images/nhs-approved.svg" alt="NHS Logo" border="0" />
            </div>
    </div></div>
</body>
</html>
