<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Side Bar</title>
</head>
<body>
<!-- side start  -->
       <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
            <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="../adminhome">
                    <div class="sidebar-brand-icon rounded"> <img src="../resources/images/profile3.jpg" alt="Icon" 
                    class="rounded-circle me-0" width="40" height="40"></div>
                    <div class="sidebar-brand-text mx-3"><span>Heart to Nerve</span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item">
                    <a class="nav-link active" href="../admin"><i class="fas fa-regular fa-user"></i><span>Admin Profile</span></a>
                    <a class="nav-link active" href="../adminAdd"><i class="fas fa-regular fa-user"></i><span>Admin Register</span></a>
                    <a class="nav-link active" href="../userlist"><i class="fas fa-solid fa-users"></i><span>User Management</span></a>                   
                    <a class="nav-link active" href="../artistmanagement"><i class="fas fa-user-astronaut"></i><span>Artist Management</span></a>
                    <a class="nav-link active" href="../artistaddform"><i class="fas fa-user-astronaut"></i><span>Artist Register</span></a>
                    <a class="nav-link active" href="../albummanagement"><i class="fas fa-solid fa-compact-disc"></i><span>Album Management</span></a>
                    <a class="nav-link active" href="../albumaddform"><i class="fas fa-solid fa-compact-disc"></i><span>Album Register</span></a>
					<a class="nav-link active" href="../songmanagement"><i class="fas fa-solid fa-music"></i><span>Song Management</span></a>
                    <a class="nav-link active" href="../songaddform"><i class="fas fa-solid fa-music"></i><span>Song Register</span></a>
                    </li>
                </ul>
                <div class="text-center d-none d-md-inline">
                <button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button>
                </div>
            </div>
        </nav>
        <!-- side end  -->
</body>
</html>