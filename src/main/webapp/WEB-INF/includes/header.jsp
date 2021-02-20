<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html>

	<head>

	<meta charset="utf-8">
    
    <meta http-equiv="x-ua-compatible" content="ie=edge">
        
    <meta name="robots" content="noindex, follow" />
    
    <meta name="description" content="">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Favicon -->
    
    <link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.ico">

	<!-- CSS
	============================================ -->
    <!-- google fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Lobster&display=swap" rel="stylesheet">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href='<c:url value ="/assets/css/vendor/bootstrap.min.css"/>'>
    <!-- Icon Font CSS -->
    <link rel="stylesheet" href='<c:url value ="/assets/css/vendor/bicon.min.css"/>'>
    <!-- Flat Icon CSS -->
    <link rel="stylesheet" href='<c:url value ="/assets/css/vendor/flaticon.css"/>'>
    <!-- audio & video player CSS -->
    <link rel="stylesheet" href='<c:url value ="/assets/css/plugins/plyr.css"/>'>
    <!-- Slick CSS -->
    <link rel="stylesheet" href='<c:url value ="/assets/css/plugins/slick.min.css"/>'>
    <!-- nice-select CSS -->
    <link rel="stylesheet" href='<c:url value ="/assets/css/plugins/nice-select.css"/>'>
    <!-- perfect scrollbar css -->
    <link rel="stylesheet" href='<c:url value ="/assets/css/plugins/perfect-scrollbar.css"/>'>
    <!-- light gallery css -->
    <link rel="stylesheet" href='<c:url value ="/assets/css/plugins/lightgallery.min.css"/>'>
    <!-- Main Style CSS -->
    <link rel="stylesheet" href='<c:url value="/assets/css/style.css" />'>

	<link rel="stylesheet" href='<c:url value="/assets/css/bootswatch.min.css"/>'>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

	<title>${!empty title ? title : 'Album' }</title>

	</head>

	<body>

		<header class="mb-2">
    
       	 <div class="header-top sticky bg-white d-none d-lg-block">
    
            <div class="container">
    
                <div class="row align-items-center">
    
                    <div class="col-md-5">
    
                        <!-- header top navigation start -->
    
                        <div class="header-top-navigation">
    
                            <nav>
    
                                <ul>
                                 
                                    <li class="active"><a href="/album">home</a></li>
                                 
                                    <li class="msg-trigger"><a class="msg-trigger-btn" href='<c:url value="/albums"/>'>My Albums</a></li>
                                    
                                    <li class="notification-trigger">
                                    
                                    	<a class="msg-trigger-btn" href="#b">Public albums</a>

                                    </li>
                    
                                </ul>
                    
                            </nav>
                    
                        </div>
                    
                        <!-- header top navigation start -->
                    
                    </div>

                    <div class="col-md-2">
                    
                        <!-- brand logo start -->
                    
                        <div class="brand-logo text-center">
                    
                            <a href="index.html">
                    
                                <img src='<c:url value="/assets/images/logo/logo.png"/>' alt="brand logo">
                    
                            </a>
                    
                        </div>
                    
                        <!-- brand logo end -->
                    
                    </div>

                    <div class="col-md-5">
                    
                        <div class="header-top-right d-flex align-items-center justify-content-end">
                    
                            <!-- header top search start -->
                    
                            <div class="header-top-search">
                    
                               <p>Hi, ${connectedUserFullName}</p>
                    
                            </div>
                    
                            <!-- header top search end -->

                            <!-- profile picture start -->
                            <div class="profile-setting-box">
                    
                                <div class="profile-thumb-small">
                    
                                    <a href="javascript:void(0)" class="profile-triger">
                    
                                        <figure>
                    
                                            <img src='<c:url value="/assets/images/profile/profile-small-1.jpg"/>' alt="profile picture">
                    
                                        </figure>
                    
                                    </a>
                    
                                    <div class="profile-dropdown">
                    
                                        <div class="profile-head">
					
											<input type="button" class="btn btn-danger col-md-12" value="Logout">
                    
                                        </div>
                    
                                    </div>
                    
                                </div>
                    
                            </div>
                            <!-- profile picture end -->
                        </div>
                        
                    </div>
                    
                </div>
                
            </div>
            
        </div>
        
    </header>
    <!-- header area end -->
    
    <div class="jumbotron">

		<h1 class="text-center mt-5">${!empty pageMainBrand ? pageMainBrand : 'Album' }</h1>
	
	</div>
