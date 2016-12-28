<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true" %>

<!DOCTYPE HTML>
<head>

    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css?family=Itim" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Aclonica|Open+Sans" rel="stylesheet">
    <title>znajdźOpiekuna</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
</head>

<body>
<div class="navbar navbar-default" style="margin-bottom: 0px;">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target=".navbar-collapse">
                <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span>
            </button>
            <div class="navbar-brand navbar-nav">
                <a href="/index">
                    <div class="logo">znajdźOpiekuna</div>
                </a>
            </div>

        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right" style="padding-right: 0px;">
                <c:if test="${pageContext.request.userPrincipal.name != null}">
                    <sec:authorize access="hasRole('ROLE_USER')">
                        <c:url value="/logout" var="logoutUrl"/>
                        <form action="${logoutUrl}" method="post" id="logoutForm">
                            <input type="hidden" name="${_csrf.parameterName}"
                                   value="${_csrf.token}"/>
                        </form>
                        <li>
                            <ol class="breadcrumb" style="float: left;">
                                <li class="active" style="color: #c09e6b;"><a
                                        href="indexService">Witaj, ${user.firstName}</a></li>
                                <li><a href="javascript:formSubmit()"> Wyloguj</a></li>
                            </ol>
                        </li>
                    </sec:authorize>
                </c:if>
                <c:if test="${pageContext.request.userPrincipal.name == null}">
                    <li><a href="login">Zaloguj się</a></li>
                    <li><a href="registration" style="color: #c09e6b;">Zarejestruj się</a></li>

                </c:if>
            </ul>
        </div>
    </div>
</div>

<div class="profile-navbar">
    <div class="container">
        <c:if test="${pageContext.request.userPrincipal.name != null}">
            <div class="col-lg-4" style="padding-left: 40px; padding-top: 22px;">
                <a href="/indexService?username=user123&address=38-200&typeOfUser=2"
                   style="color: white; font-size: 20px; padding-right: 20px;">Znajdź</a>
                <a href="/news/0" style="color: white; font-size: 16px; padding-right: 20px;">Aktualności</a>
                <a href="#" style="color: white; font-size: 16px; padding-right: 20px;">Forum</a>
            </div>
            <div class="col-lg-3 col-lg-offset-5" style="padding-left: 50px; padding-top: 10px;">
                <a href="/showMyProfile" style="color: white; font-size: 13px; padding-right: 20px;">Profil</a>
                <a href="/editMyProfile" style="color: white; font-size: 13px;  padding-right: 20px;">Ustawienia</a>
                <a href="/message/0" style="color: white; font-size: 13px;">Wiadomości</a>
            </div>
        </c:if>
    </div>
</div>
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <div class="container" style="background-color: white;">
        <ul class="nav nav-tabs"  role="tablist" >
            <li role="presentation" ><a style="font-size: 18px; " href="/showMyProfile">Profil</a></li>
            <li role="presentation"><a style="font-size: 18px; " href="/editMyProfile">Edycja</a></li>
            <li role="presentation"><a style="font-size: 18px; " href="/advancedSettings">Zaawansowane</a></li>
            <c:if test="${user.role eq 'ADMINISTRATOR'}">
                <li role="presentation"><a href="/newsManagement" style="font-size: 18px; " >Zarządzaj aktualnościami</a></li>
                <li role="presentation" class="active"><a href="/usersManagement" style="font-size: 18px; ">Zarządzaj użytkownikami</a></li>
            </c:if>
        </ul>
    </div>
</c:if>

<div class="container" style="min-height: 500px; background-color: white">
    <div class="col-lg-12" style="padding-top: 50px;">
        <form method="post" action="/usersManagement">
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            <table class="table table-fixed">
                <thead>
                <tr>
                    <th class="col-xs-3" style="text-align: center">ID</th>
                    <th class="col-xs-2" style="text-align: center">Potwierdzony</th>
                    <th class="col-xs-2" style="text-align: center">Dane</th>
                    <th class="col-xs-2" style="text-align: center">Email</th>
                    <th class="col-xs-2" style="text-align: center">Lokalizacja</th>
                    <th class="col-xs-1" style="text-align: center">Aktywny</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="listValue" items="${userList}">
                    <tr>
                        <td class="col-xs-3" style="text-align: center">
                                ${listValue.id} <input type="checkbox" style=" margin: 0px;" name="id" value="${listValue.id}">
                        </td>
                    </tr>
                    <tr>
                        <td class="col-xs-2" style="text-align: center">
                                ${listValue.identity}
                        </td>
                    </tr>
                    <tr>
                        <td class="col-xs-2" style="text-align: center">
                                ${listValue.firstName} ${listValue.lastName}
                        </td>
                    </tr>
                    <tr>
                        <td class="col-xs-2" style="text-align: center">
                                ${listValue.username}
                        </td>
                    </tr>
                    <tr>
                        <td class="col-xs-2" style="text-align: center">
                                ${listValue.zipCode} ${listValue.town}
                        </td>
                    </tr>
                    <tr>
                        <td class="col-xs-1" style="text-align: center">
                                ${listValue.active}
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
            <div class="col-lg-4 col-lg-offset-8">
                <button name="operation" value="identity" style="width: 200px;" class="btn btn-primary">Potwierdź tożsamość</button>
                <button name="operation" value="delete" class="btn btn-danger">Usuń</button>
            </div>
        </form>
    </div>
</div>

<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/scrollReveal.js"></script>
<script src="resources/js/custom.js"></script>
<script src="resources/js/script.js"></script>

</body>
</html>