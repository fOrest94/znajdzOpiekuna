<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE HTML>
<html lang="pl_PL">
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">
	<link href="resources/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="resources/css/style.css" rel="stylesheet"/>
	<link href="resources/css/font-awesome.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Itim" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Aclonica|Open+Sans" rel="stylesheet">
	<title>znajdźOpiekuna</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>

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
							<a href="#"><div class="logo">znajdźOpiekuna</div></a>
		                </div>

			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<c:if test="${pageContext.request.userPrincipal.name != null}">
					<sec:authorize access="hasRole('ROLE_USER')">
					<c:url value="/logout" var="logoutUrl" />
					<form action="${logoutUrl}" method="post" id="logoutForm">
						<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					</form>								
						<li>
							<ol class="breadcrumb" style="float: left;">
								<li class="active" style="color: #c09e6b;"><a href="indexService">Witaj, ${user.firstName}</a></li>
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
	<div class="profile-navbar" >
		<div class="container">
			<c:if test="${pageContext.request.userPrincipal.name != null}">
				 <div class="col-lg-3 col-lg-offset-9" style="padding-left: 50px; padding-top: 10px;">
				 	 <a href="showProfile" style="color: white; font-size: 13px; padding-right: 20px;">Profil</a>
					 <a href="profile" style="color: white; font-size: 13px;  padding-right: 20px;">Ustawienia</a>
					 <a href="profile" style="color: white; font-size: 13px;">Wiadomości</a>
				 </div>
			</c:if>
		</div>
	</div>
	
	<div class="search-navbar">
		<div class="container" style="padding-top: 20px; font-size: 15px;">
			
			  <div class="col-lg-2">
			      <label for="ch1">Szukam</label>
			      <select id="ch1" class="selectpicker show-tick" data-width="170px" >
					  <optgroup label="opieka nad dziećmi">
					      <option style="font-size: 18px; color: black !important;">Niani</option>
					      <option style="font-size: 18px;">Ofert opieki</option>
					  </optgroup>
					  <optgroup label="opieka nad starszymi">
					      <option style="font-size: 18px;">Opiekunek</option>
					      <option style="font-size: 18px;">Ofert opieki</option>
					  </optgroup>
					  <optgroup label="opieka nad domem">
					      <option style="font-size: 18px;">Pomocy domowej</option>
					      <option style="font-size: 18px;">Ofert pomocy</option>
					  </optgroup>
				  </select>
			  </div>
			  <div class="col-lg-2" >
				  <label for="ch2">Gdzie</label>
				  <input id="ch2" type="text" class="form-control" placeholder="Miasto">
			  </div>
			  <button type="submit" class="btn btn-danger"  style="margin-top: 24px; font-size: 19px; height: 40px;">Szukaj</button>
		</div>
	</div>

<div id="mainSectionService">
	<div class="container">
		<div class="col-lg-3">
			<table class="table" >
				<thead >
				<tr>
					<th style="height: 56px; font-size: 20px;">Aktualności</th>
				</tr>
				</thead>
				<tbody><c:forEach var="listValue" items="${browseList}">
					<tr>
						<td style="height: 30px; text-align: left;">
							gdfgdfgdfgdf
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-lg-9" >
			<h3 style="text-align: left">Lokalizacja: Kraków</h3>
			<c:if test="${not empty browseList}">
				<table class="table" >
					<tbody><c:forEach var="listValue" items="${browseList}">
					<tr>

						<td style="height: 140px;">
							<div class="col-lg-3">
								<img src="resources/pictures/profileImages/${listValue.id}.jpg" width="120" height="120" style="padding-bottom: 0px;">
							</div>
							<div class="col-lg-3">
								<h3 style="">${listValue.firstName} ${listValue.lastName}</h3>
								<p>${listValue.town} ${listValue.zipCode}</p>
							</div>
							<div class="col-lg-3 col-lg-offset-3">
								<button type="submit" class="btn btn-danger"  style="margin-top: 30px; font-size: 16px; height: 35px;">Pokaż profil</button>

							</div>

						</td>

					</tr>
					</c:forEach>
					</tbody>
				</table>

			</c:if>
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