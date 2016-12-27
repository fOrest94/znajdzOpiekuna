<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="path" uri="http://www.springframework.org/tags/form" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html lang="pl_PL">
<head>

    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/style.css" rel="stylesheet">

    <title>Rejestracja</title>
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

    p {
        text-align: left;
        font-family: 'Itim', cursive;
        font-size: 21px;
        color: #52452e;
        margin-bottom: 0px;
    }
</style>
<body>
<div class="container" style=" margin-top: 300px;">
    <div id="signupbox" style="margin-top:50px" class="col-md-8 col-md-offset-2"
         data-scrollreveal="enter bottom and move 300px, wait 0.2s">
        <div class="panel panel-danger" style="border-color: #fcb2ab;">
            <div class="panel-heading">
                <div class="panel-title">Sign Up</div>

            </div>
            <div class="panel-body">
                <form:form method="POST" modelAttribute="userForm" class="form-horizontal">

                    <div id="signupalert" style="display:none" class="alert alert-danger">
                        <p>Error:</p>
                        <span></span>
                    </div>

                    <div class="form-group">
                        <label for="firstName" class="col-md-3 control-label" style="text-align: left;">Dane</label>
                        <div class="col-md-4" style="margin-right: 10px;">
                            <spring:bind path="firstName">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="firstName" class="form-control"
                                                placeholder="Imię"></form:input>
                                    <form:errors path="firstName"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                        <div class="col-md-4">
                            <spring:bind path="lastName">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="lastName" class="form-control"
                                                placeholder="Nazwisko"></form:input>
                                    <form:errors path="lastName"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="username" class="text-left col-md-3 control-label "
                               style="text-align: left">Email</label>
                        <div class="col-md-4">
                            <spring:bind path="username">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="username" class="form-control" placeholder="Email"
                                                autofocus="true"></form:input>
                                    <form:errors path="username"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                        <div class="col-md-4">
                            <spring:bind path="sex">
                                <path:select path="sex" id="nanny-experience" style=" margin-left: 20px;  margin-top: 5px; border-radius: 3px; font-size: 18px;">
                                    <path:option value="kobieta" >Kobieta</path:option>
                                    <path:option value="mężczyzna">Mężczyzna</path:option>
                                </path:select>
                                <form:errors path="sex" cssClass="error"/>
                            </spring:bind>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="col-md-3 control-label" style="text-align: left">Hasło</label>
                        <div class="col-md-4">
                            <spring:bind path="password">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="password" path="password" class="form-control"
                                                placeholder="Hasło"></form:input>
                                    <form:errors path="password"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="password" class="col-md-3 control-label" style="text-align: left">Powtórz
                            hasło</label>
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
                        <label for="password" class="col-md-3 control-label" style="text-align: left">Data urodzenia</label>
                        <div class="col-md-4" style="padding-top: 5px;">
                            <spring:bind path="dateOfBirth">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <div class="control-group">
                                        <div class="controls">
                                            <path:select path="dobDay" id="dob-day">
                                                <path:option value="">Day</path:option>
                                                <path:option value="01">01</path:option>
                                                <path:option value="02">02</path:option>
                                                <path:option value="03">03</path:option>
                                                <path:option value="04">04</path:option>
                                                <path:option value="05">05</path:option>
                                                <path:option value="06">06</path:option>
                                                <path:option value="07">07</path:option>
                                                <path:option value="08">08</path:option>
                                                <path:option value="09">09</path:option>
                                                <path:option value="10">10</path:option>
                                                <path:option value="11">11</path:option>
                                                <path:option value="12">12</path:option>
                                                <path:option value="13">13</path:option>
                                                <path:option value="14">14</path:option>
                                                <path:option value="15">15</path:option>
                                                <path:option value="16">16</path:option>
                                                <path:option value="17">17</path:option>
                                                <path:option value="18">18</path:option>
                                                <path:option value="19">19</path:option>
                                                <path:option value="20">20</path:option>
                                                <path:option value="21">21</path:option>
                                                <path:option value="22">22</path:option>
                                                <path:option value="23">23</path:option>
                                                <path:option value="24">24</path:option>
                                                <path:option value="25">25</path:option>
                                                <path:option value="26">26</path:option>
                                                <path:option value="27">27</path:option>
                                                <path:option value="28">28</path:option>
                                                <path:option value="29">29</path:option>
                                                <path:option value="30">30</path:option>
                                                <path:option value="31">31</path:option>
                                            </path:select>
                                            <path:select path="dobMonth" id="dob-month">
                                                <path:option value="">Month</path:option>
                                                <path:option value="01">January</path:option>
                                                <path:option value="02">February</path:option>
                                                <path:option value="03">March</path:option>
                                                <path:option value="04">April</path:option>
                                                <path:option value="05">May</path:option>
                                                <path:option value="06">June</path:option>
                                                <path:option value="07">July</path:option>
                                                <path:option value="08">August</path:option>
                                                <path:option value="09">September</path:option>
                                                <path:option value="10">October</path:option>
                                                <path:option value="11">November</path:option>
                                                <path:option value="12">December</path:option>
                                            </path:select>
                                            <path:select path="dobYear" id="dob-year">
                                                <path:option value="">Year</path:option>
                                                <path:option value="">----</path:option>
                                                <path:option value="2012">2012</path:option>
                                                <path:option value="2011">2011</path:option>
                                                <path:option value="2010">2010</path:option>
                                                <path:option value="2009">2009</path:option>
                                                <path:option value="2008">2008</path:option>
                                                <path:option value="2007">2007</path:option>
                                                <path:option value="2006">2006</path:option>
                                                <path:option value="2005">2005</path:option>
                                                <path:option value="2004">2004</path:option>
                                                <path:option value="2003">2003</path:option>
                                                <path:option value="2002">2002</path:option>
                                                <path:option value="2001">2001</path:option>
                                                <path:option value="2000">2000</path:option>
                                                <path:option value="1999">1999</path:option>
                                                <path:option value="1998">1998</path:option>
                                                <path:option value="1997">1997</path:option>
                                                <path:option value="1996">1996</path:option>
                                                <path:option value="1995">1995</path:option>
                                                <path:option value="1994">1994</path:option>
                                                <path:option value="1993">1993</path:option>
                                                <path:option value="1992">1992</path:option>
                                                <path:option value="1991">1991</path:option>
                                                <path:option value="1990">1990</path:option>
                                                <path:option value="1989">1989</path:option>
                                                <path:option value="1988">1988</path:option>
                                                <path:option value="1987">1987</path:option>
                                                <path:option value="1986">1986</path:option>
                                                <path:option value="1985">1985</path:option>
                                                <path:option value="1984">1984</path:option>
                                                <path:option value="1983">1983</path:option>
                                                <path:option value="1982">1982</path:option>
                                                <path:option value="1981">1981</path:option>
                                                <path:option value="1980">1980</path:option>
                                                <path:option value="1979">1979</path:option>
                                                <path:option value="1978">1978</path:option>
                                                <path:option value="1977">1977</path:option>
                                                <path:option value="1976">1976</path:option>
                                                <path:option value="1975">1975</path:option>
                                                <path:option value="1974">1974</path:option>
                                                <path:option value="1973">1973</path:option>
                                                <path:option value="1972">1972</path:option>
                                                <path:option value="1971">1971</path:option>
                                                <path:option value="1970">1970</path:option>
                                                <path:option value="1969">1969</path:option>
                                                <path:option value="1968">1968</path:option>
                                                <path:option value="1967">1967</path:option>
                                                <path:option value="1966">1966</path:option>
                                                <path:option value="1965">1965</path:option>
                                                <path:option value="1964">1964</path:option>
                                                <path:option value="1963">1963</path:option>
                                                <path:option value="1962">1962</path:option>
                                                <path:option value="1961">1961</path:option>
                                                <path:option value="1960">1960</path:option>
                                                <path:option value="1959">1959</path:option>
                                                <path:option value="1958">1958</path:option>
                                                <path:option value="1957">1957</path:option>
                                                <path:option value="1956">1956</path:option>
                                                <path:option value="1955">1955</path:option>
                                                <path:option value="1954">1954</path:option>
                                                <path:option value="1953">1953</path:option>
                                                <path:option value="1952">1952</path:option>
                                                <path:option value="1951">1951</path:option>
                                                <path:option value="1950">1950</path:option>
                                                <path:option value="1949">1949</path:option>
                                                <path:option value="1948">1948</path:option>
                                                <path:option value="1947">1947</path:option>
                                                <path:option value="1946">1946</path:option>
                                                <path:option value="1945">1945</path:option>
                                                <path:option value="1944">1944</path:option>
                                                <path:option value="1943">1943</path:option>
                                                <path:option value="1942">1942</path:option>
                                                <path:option value="1941">1941</path:option>
                                            </path:select>
                                        </div>
                                    </div>
                                </div>
                            </spring:bind>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-md-3 control-label" style="text-align: left">Szukam</label>
                        <div class="col-md-8 ">
                            <div class="col-md-5" style="margin-right: 20px;  margin-left: 30px;">
                                <div class="radio">
                                    <label style="font-size: 1.2em">
                                        <form:radiobutton path="userType" value="2"/>Pracy
                                        <span class="cr"><i
                                                class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-5 ">
                                <div class="radio">
                                    <label style="font-size: 1.2em">
                                        <form:radiobutton path="userType" value="1"/>Opieki
                                        <span class="cr"><i
                                                class="cr-icon fa fa-circle glyphicon glyphicon-ok"></i></span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group" style="padding-top: 20px;">
                        <label for="town" class="col-md-3 control-label" style="text-align: left">Lokalizacja</label>
                        <div class="col-md-4" style="margin-right: 10px;">
                            <spring:bind path="town">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="town" class="form-control"
                                                placeholder="Miasto"></form:input>
                                    <form:errors path="town"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                        <div class="col-md-4">
                            <spring:bind path="zipCode">
                                <div class="form-group ${status.error ? 'has-error' : ''}">
                                    <form:input type="text" path="zipCode" class="form-control"
                                                placeholder="Kod pocztowy"></form:input>
                                    <form:errors path="zipCode"></form:errors>
                                </div>
                            </spring:bind>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="checkbox col-md-8  col-md-offset-3 control-label" style="text-align: left">
                            <input type="checkbox" id="rulesRequired" name="test" required>Zapoznałem się z treścią
                            regulaminu i wyrażam na niego zgodę
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-md-offset-3 col-md-9">
                            <input type="submit" value="Zarejestruj się" class="btn btn-danger"
                                   style="font-size: 16px; width: 130px;">
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
