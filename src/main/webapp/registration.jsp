<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html lang="pl_PL">
<head>

    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/font-awesome.css" rel="stylesheet">
    <link href="resources/css/style.css" rel="stylesheet">

    <title>Rejestracja</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>

<body>

<div class="container" style=" margin-top: 300px;">
    <div id="signupbox" style="margin-top:50px" class="col-md-8 col-md-offset-2" data-scrollreveal="enter bottom and move 300px, wait 0.2s">
        <div class="panel panel-danger" style="border-color: #fcb2ab;">
            <div class="panel-heading">
                <div class="panel-title">Sign Up</div>

            </div>
            <div class="panel-body" >
                <form:form method="POST" modelAttribute="userForm" id="registerParent" class="form-horizontal">

                    <div id="signupalert" style="display:none" class="alert alert-danger">
                        <p>Error:</p>
                        <span></span>
                    </div>

                    <div class="form-group">
                        <label for="firstName" class="col-md-3 control-label"  style="text-align: left">Dane</label>
                        <div class="col-md-4">
                            <spring:bind path="firstName">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="firstName" class="form-control" placeholder="Imię"></form:input>
                                    <form:errors path="firstName"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                        <div class="col-md-4">
                            <spring:bind path="lastName">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="lastName" class="form-control" placeholder="Nazwisko"></form:input>
                                    <form:errors path="lastName"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="username" class="text-left col-md-3 control-label " style="text-align: left">Email</label>
                        <div class="col-md-4">
                            <spring:bind path="username">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="username" class="form-control" placeholder="Email" autofocus="true"></form:input>
                                    <form:errors path="username"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>

                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <div class="form-group">
                        <label for="password" class="col-md-3 control-label"  style="text-align: left">Hasło</label>
                        <div class="col-md-4">
                            <spring:bind path="password">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="password" path="password" class="form-control" placeholder="Hasło"></form:input>
                                    <form:errors path="password"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="col-md-3 control-label"  style="text-align: left">Powtórz hasło</label>
                        <div class="col-md-4">
                            <spring:bind path="passwordConfirm">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="password" path="passwordConfirm" class="form-control"
                                                placeholder="Powtórz hasło"></form:input>
                                    <form:errors path="passwordConfirm"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="searchButton" class="col-md-3 control-label"  style="text-align: left">Szukam</label>
                        <div class="col-md-8 ">
                            <div class="col-md-5 ">
                                <div class="radio">
                                    <label style="font-size: 1.2em">
                                        <form:radiobutton path="userType" value="sister"/>Pracy
                                        <span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-5 ">
                                <div class="radio">
                                    <label style="font-size: 1.2em">
                                        <form:radiobutton path="userType" value="simple"/>Opieki
                                        <span class="cr"><i class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group" style="padding-top: 20px;">
                        <label for="town" class="col-md-3 control-label"  style="text-align: left">Lokalizacja</label>
                        <div class="col-md-4">
                            <spring:bind path="town">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="town" class="form-control" placeholder="Miasto"></form:input>
                                    <form:errors path="town"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                        <div class="col-md-4">
                            <spring:bind path="zipCode">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="zipCode" class="form-control" placeholder="Kod pocztowy"></form:input>
                                    <form:errors path="zipCode"></form:errors>
                                </div>
                            </spring:bind>
                        </div>

                    </div>

                    <div class="form-group">
                        <div class="checkbox col-md-8  col-md-offset-3 control-label" style="text-align: left">
                            <label>
                                <input type="checkbox" id="rulesRequired" name="test" required>Zapoznałem się z treścią regulaminu i wyrażam na niego zgodę
                            </label>
                        </div>
                    </div>

                    <div class="form-group">
                        <!-- Button -->
                        <div class="col-md-offset-3 col-md-9">
                            <input type="submit" value="Zarejestruj się" class="btn btn-danger" style="font-size: 14px;">
                        </div>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>

<script src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap.min.js"></script>
<script src="resources/js/scrollReveal.js"></script>
<script src="resources/js/custom.js"></script>
</body>
</html>
