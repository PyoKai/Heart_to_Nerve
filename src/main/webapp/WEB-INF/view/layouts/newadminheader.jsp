<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Header</title>
</head>
<body>

<!-- nav bar start -->
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                    	<div class="nav-item dropdown no-arrow" >
                                	<a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#" >
                                		
                                			<img class="border rounded-circle img-profile" src="../assets/img/avatars/profile3.jpg" >
                                			<span class="d-none d-lg-inline me-2 text-gray-600 large"> : ${adminName}</span>
                                	</a>
                                    
                                </div>
                    
                        <ul class="navbar-nav flex-nowrap ms-auto">
                            
                             <li class="nav-item dropdown no-arrow mx-1"></li>
                            <li class="nav-item dropdown no-arrow mx-1">
                                <div class="shadow dropdown-list dropdown-menu dropdown-menu-end" aria-labelledby="alertsDropdown"></div>
                            </li>
                            <div class="d-none d-sm-block topbar-divider"></div>
                            <li class="nav-item dropdown no-arrow">
                                <div class="nav-item dropdown no-arrow">
                                 <a class="dropdown-toggle nav-link"  href="../logout">
                             	<i class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-green" ></i>&nbsp;Logout
                                </a>
                                    
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
               <!-- nav bar end  -->
	


</body>
</html>