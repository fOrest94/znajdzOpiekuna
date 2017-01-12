<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page session="true" %>

<!DOCTYPE HTML>
<html lang="pl_PL">
<head>
    <link rel="shortcut icon" type="image/x-icon" href="/img/bookmark.png">
    <link
            href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
            rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css"
          rel="stylesheet"/>
    <link
            href="${pageContext.request.contextPath}/resources/css/font-awesome.css"
            rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Itim"
          rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Aclonica|Open+Sans"
          rel="stylesheet">
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
                <a href="/ranking" style="color: white; font-size: 16px; padding-right: 20px;">Ranking</a>
            </div>
            <div class="col-lg-4 col-lg-offset-4" style="padding-left: 120px; padding-top: 10px;">
                <a href="/showMyProfile" style="color: white; font-size: 13px; padding-right: 20px;">Profil</a>
                <a href="/editMyProfile" style="color: white; font-size: 13px;  padding-right: 20px;">Ustawienia</a>
                <a href="/message/0" style="color: white; font-size: 13px;">Wiadomości
                    <c:if test="${unreadMess != 0}">
                        (${unreadMess})
                    </c:if></a>
            </div>
        </c:if>
    </div>
</div>

<c:if test="${pageContext.request.userPrincipal.name != null}">
    <div class="container" style="background-color: white;">
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation"><a style="font-size: 18px; " href="/showMyProfile">Profil</a></li>
            <li role="presentation"><a style="font-size: 18px; " href="/editMyProfile">Edycja</a></li>
            <li role="presentation" class="active"><a style="font-size: 18px; "
                                                      href="/advancedSettings">Zaawansowane</a></li>
            <c:if test="${user.role eq 'ADMINISTRATOR'}">
                <li role="presentation"><a href="/newsManagement" style="font-size: 18px; ">Zarządzaj aktualnościami</a>
                </li>
                <li role="presentation"><a href="/usersManagement" style="font-size: 18px; ">Zarządzaj użytkownikami</a>
                </li>
            </c:if>
        </ul>
    </div>
</c:if>

<div class="container" style="min-height: 500px; background-color: white">
    <div class="col-lg-12" style="padding-top: 50px;">

        <form method="POST" action="/userProfileEditEmail" class="form-signin">
            <div class="form-group">
                <div class="col-lg-12">
                    <label class="col-md-3 control-label"
                           style="text-align: left; padding-top: 5px;">Zmień
                        email<div id="ss" style="color: red; font-size: 22px; display: inline"> * </div> </label>
                    <div class="col-md-4">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <input type="text" name="userName"
                                   class="form-control"
                                   placeholder="Nowy Email"></input>
                        </div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                    <div class="col-lg-5 controls"
                         style="margin-bottom: 10px; padding-left: 0px;">
                        <input type="hidden" name="id" value="${user.id}">
                        <input type="submit" name="submit" value="Zmień"
                               class="btn btn-danger"
                               style=" width: 100px;">
                    </div>
                </div>
            </div>
        </form>

        <form method="POST" action="/userProfileEditPassword" class="form-signin">
            <h4 style="text-align: left; padding-left: 30px;">Zmień hasło</h4>
            <div class="form-group">
                <div class="col-lg-12">
                    <label class="col-md-3 control-label"
                           style="text-align: left; padding-top: 5px;">Obecne
                        hasło</label>
                    <div class="col-md-4">
                        <input type="hidden" name="id" value="${user.id}">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <input type="password" name="password1"
                                   class="form-control"
                                   placeholder="Obecne hasło"></input>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <label class="col-md-3 control-label"
                           style="text-align: left; padding-top: 5px;">Nowe
                        hasło</label>
                    <div class="col-md-4">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <input type="password" name="password2"
                                   class="form-control"
                                   placeholder="Nowe hasło"></input>
                        </div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                    <div class="col-lg-5 controls"
                         style="margin-bottom: 10px; padding-left: 0px;">
                        <input type="submit" name="submit" value="Zmień"
                               class="btn btn-danger"
                               style=" width: 100px;">
                    </div>
                </div>

            </div>
        </form>
        <form method="POST" action="/userProfileEditStreet" class="form-signin">

            <div class="form-group">
                <div class="col-lg-12">
                    <label class="col-md-3 control-label"
                           style="text-align: left; padding-top: 5px;">Zmień
                        ulice</label>
                    <div class="col-md-4">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <input type="text" name="street"
                                   class="form-control"
                                   placeholder="Ulica"></input>
                        </div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                    <div class="col-lg-5 controls"
                         style="margin-bottom: 10px; padding-left: 0px;">
                        <input type="hidden" name="id" value="${user.id}">
                        <input type="submit" name="submit" value="Zmień"
                               class="btn btn-danger"
                               style=" width: 100px;">
                    </div>
                </div>
            </div>
        </form>
        <form method="POST" action="/userProfileEditPhone" class="form-signin">

            <div class="form-group">
                <div class="col-lg-12">
                    <label class="col-md-3 control-label"
                           style="text-align: left; padding-top: 5px;">Zmień nr.
                        telefonu</label>
                    <div class="col-md-4">
                        <div class="form-group ${status.error ? 'has-error' : ''}">
                            <input type="text" name="phone"
                                   class="form-control"
                                   placeholder="Telefon"></input>
                        </div>
                    </div>
                    <input type="hidden" name="${_csrf.parameterName}"
                           value="${_csrf.token}"/>
                    <div class="col-lg-5 controls"
                         style="margin-bottom: 10px; padding-left: 0px;">
                        <input type="hidden" name="id" value="${user.id}">
                        <input type="submit" name="submit" value="Zmień"
                               class="btn btn-danger"
                               style=" width: 100px;">
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="$/resources/js/jquery.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/scrollReveal.js"></script>
<script src="/resources/js/custom.js"></script>
<script src="/resources/js/script.js"></script>

</body>
</html>