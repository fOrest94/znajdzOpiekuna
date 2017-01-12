<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html lang="pl_PL">
<head>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">
    <link href="resources/css/bootstrap.min.css" rel="stylesheet"/>
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
<div class="navbar navbar-default " style="margin-bottom: 0px;">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <div class="navbar-brand navbar-nav">
                <a href="#">
                    <div class="logo">znajdźOpiekuna</div>
                </a>
            </div>

        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav navbar-right">
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
                                <li><a href="javascript:formSubmit();"> Wyloguj</a></li>
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

<div class="container" style="padding-top: 80px;">
    <div class="col-lg-6 col-lg-offset-3">
        <div class="panel panel-default" style="border-radius: 16px;">
            <h2><div class="logo" >Ranking TOP 10</div></h2>
            <div class="panel-body" style="width: 90%; padding-top: 30px;">
                <ul class="nav nav-tabs" style="font-size: 10px; " role="tablist">
                    <li role="presentation" class="active"><a style="font-size: 18px; " id="haha" onclick="sendMessage()">Opiekunowie</a>
                    </li>
                    <li role="presentation" class="active"><a style="font-size: 18px; " id="hahaha" onclick="showMessage()">Oferty pracy</a></li>
                </ul>
                <div class="col-md-12" id="sendMessageBookmark"
                     style=" padding-left: 0px; padding-top: 10px;">
                    <c:if test="${not empty topCares}">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th class="col-md-4">Dane opiekuna</th>
                                <th class="col-md-4">Lokalizacja</th>
                                <th class="col-md-4">Ocena</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="listView" items="${topCares}">
                                <tr>
                                    <td class="col-md-4"><a href="" style="color: #0f0f0f;">${listView.firstName} ${listView.lastName}</a></td>
                                    <td class="col-md-4">${listView.town}</td>
                                    <td class="col-md-4">${listView.mark}</td>
                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>
                    </c:if>
                </div>
                <div class="col-md-12" id="showMessageBookmark"
                     style="padding-left: 0px; padding-top: 10px;">

                    <c:if test="${not empty topOffers}">
                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th class="col-md-4">Oferta pracy</th>
                                <th class="col-md-4">Lokalizacja</th>
                                <th class="col-md-4">Ocena</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="listView" items="${topOffers}">
                                <tr>
                                    <td class="col-md-4"><a href=""  style="color: #0f0f0f;">${listView.firstName} ${listView.lastName}</a></td>
                                    <td class="col-md-4">${listView.town}</td>
                                    <td class="col-md-4">${listView.mark}</td>
                                </tr>
                            </c:forEach>
                            </tbody>

                        </table>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/scrollReveal.js"></script>
<script src="resources/js/custom.js"></script>
<script src="resources/js/script.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>

</body>
</html>