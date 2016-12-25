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
<style>
    body {
        background: url("/resources/img/main-wallpaper.png") no-repeat center center fixed;
        -webkit-background-size: cover;
        -moz-background-size: cover;
        -o-background-size: cover;
        background-size: cover;
    }
</style>
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
            <div class="col-lg-3" style="padding-left: 50px; padding-top: 22px;">
                <a href="news/0" style="color: white; font-size: 20px; padding-right: 20px;">Aktualności</a>
            </div>
            <div class="col-lg-3 col-lg-offset-6" style="padding-left: 50px; padding-top: 10px;">
                <a href="showMyProfile" style="color: white; font-size: 13px; padding-right: 20px;">Profil</a>
                <a href="editMyProfile" style="color: white; font-size: 13px;  padding-right: 20px;">Ustawienia</a>
                <a href="messages" style="color: white; font-size: 13px;">Wiadomości</a>
            </div>
        </c:if>
    </div>
</div>
<c:if test="${pageContext.request.userPrincipal.name != null && whatShow == 1}">
    <div class="container" style="background-color: white;">
        <ul class="nav nav-tabs" style="font-size: 10px;" role="tablist">
            <li role="presentation" class="active"><a href="showMyProfile">Profil</a></li>
            <li role="presentation"><a href="editMyProfile">Edycja</a></li>
            <li role="presentation"><a href="newsManagement">Dodaj aktualność</a></li>

        </ul>
    </div>
</c:if>
<div class="container">
    <div class="col-md-offset-1 col-md-10"  data-scrollreveal="enter left and move 150px over 1.33s">
    <div class="panel panel-default" style="margin-top: 120px; border-radius: 16px;">
        <div class="panel-body" style="width: 90%; padding-top: 30px;">
            <form:form method="post" modelAttribute="messageForm" class="form-horizontal" action="/message">
                <div class="form-group">
                    <label class="col-sm-2 control-label">Do:</label>
                    <div class="col-sm-10" style="padding-top: 5px;">
                       Natalia Siwiec
                    </div>
                </div>
                <div class="form-group">
                    <label for="name" class="col-sm-2 control-label">Temat</label>
                    <div class="col-sm-10">
                        <form:input path="message_title" type="text" class="form-control" id="name" name="name" placeholder="Temat wiadomości"
                               value=""/>
                    </div>
                </div>
                <div class="form-group">
                    <label for="message" class="col-sm-2 control-label"></label>
                    <div class="col-sm-10">
                        <form:textarea path="message_description" class="form-control" rows="15" name="message"/>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-10 col-sm-offset-2">
                        <input id="submit" name="submit" type="submit" value="Wyślij" class="btn btn-danger">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-10 col-sm-offset-2">
                        <! Will be used to display an alert to the user>
                    </div>
                </div>
            </form:form>
        </div></div>
    </div>
</div>


<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/scrollReveal.js"></script>
<script src="resources/js/custom.js"></script>
<script src="resources/js/script.js"></script>

</body>
</html>