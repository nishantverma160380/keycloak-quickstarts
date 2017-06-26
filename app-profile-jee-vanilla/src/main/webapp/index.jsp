<!--
    JBoss, Home of Professional Open Source
    Copyright 2016, Red Hat, Inc. and/or its affiliates, and individual
    contributors by the @authors tag. See the copyright.txt in the
    distribution for a full listing of individual contributors.

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at
    http://www.apache.org/licenses/LICENSE-2.0
    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
-->

<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<html>
    <head>
        <style>
            label {display: inline-block;width: 200px;text-align: right;margin-right: 10px;}
            button {margin-left: 215px;}
            form {background-color: #eee;border: 1px solid #666;padding-bottom: 1em;}
            .error {color: #a30000;}
        </style>
        <link rel="stylesheet" type="text/css" href="styles.css"/>

        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>NHS Health App</title>

    </head>
    <body>

        <jsp:useBean id="controller" class="org.keycloak.quickstart.profilejee.Controller" scope="request"/>
        <% controller.handleLogout(request); %>

        <c:set var="isLoggedIn" value="<%=controller.isLoggedIn(request)%>"/>
        <c:if test="${isLoggedIn}">
            <c:redirect url="profile.jsp"/>
        </c:if>

        <div class="wrapper">
            <div class="content">
                <div class="logo">
                        <img src="images/nhs-logo.png" alt="NHS Logo" border="0" />
                </div>
                <h1>Welcome to NHS Digital</h1>

                <p>&nbsp;</p>

                <p>Single Sign On | <a href="profile.jsp">Please Login</a> </p>

                <p>&nbsp;</p>

                <p class="logos">
                    <a href="http://www.keycloak.org/"><img src="images/keycloak_logo.png" alt="Keycloak" width="254" height="31" border="0"></a> &nbsp;
                    <a href="http://www.jboss.org"><img src="images/jboss_community.png" alt="JBoss and JBoss Community" width="254" height="31" border="0"></a>
                </p>

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
