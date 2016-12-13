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
				</ul>
			</div>
		</div>
	</div>
	<div class="profile-navbar" >
		<div class="container">
				 <div class="col-lg-3 col-lg-offset-9" style="padding-left: 50px; padding-top: 10px;">
				 	 <a href="showProfile" style="color: white; font-size: 13px; padding-right: 20px;">Profil</a>
					 <a href="profile" style="color: white; font-size: 13px;  padding-right: 20px;">Ustawienia</a>
					 <a href="profile" style="color: white; font-size: 13px;">Wiadomości</a>
				 </div>
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
			  <button type="submit" class="btn btn-danger"  style="margin-top: 26px; font-size: 20px; height: 40px;">Szukaj</button>		
		</div>
	</div>

<div id="mainSectionService">
	<div class="container">
		<div class="col-lg-3">
		</div>
		<div class="col-lg-9" style="background-color: grey;">
		fgfghgffffffffffffff<br>fgdgdgd<br>
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