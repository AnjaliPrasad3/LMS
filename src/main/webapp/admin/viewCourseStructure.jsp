<%@page import="com.lms.UserDaw.UserDaw"%>
<%@page import="com.lms.UserModel.UserModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Course Structure</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="../assets/css/style.css">

</head>
<body>
<% List<UserModel> list = UserDaw.getCourseStructure(); %>
 <!-- Header -->
    <header class="header" data-header>
        <div class="container">
            <a href="/" class="logo">
                <img src="../assets/images/logo.svg" width="162" height="50" alt="EduWeb logo">
            </a>

            <!-- Header Actions -->
            <div class="header-actions">
                <!-- Search Box -->
                <div class="input-group">
                    <input type="text" class="form-control" placeholder="Search..." aria-label="Search"
                        aria-describedby="searchIcon">
                    <button class="btn btn-outline-secondary" type="button" id="searchIcon">
                        <i class="bi bi-search"></i>
                    </button>
                </div>

                <ul class="navbar-nav">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle ms-2" href="#" id="userDropdown" role="button">
                            <i class="bi bi-person-fill"></i>
                        </a>
                    </li>
                </ul>

            </div>
            <div class="overlay" data-nav-toggler data-overlay></div>
        </div>
    </header>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link" href="admin.jsp">
                    <i class="bi bi-house-door"></i> Dashboard
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="bi bi-people"></i> Users
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="courses.jsp">
                    <i class="bi bi-file-earmark-text"></i> Courses
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="purchasedCourse.jsp">
                    <i class="bi bi-bag"></i> Purchased Courses
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="courseStructure.jsp">
                    <i class="bi bi-book"></i> Course Structure
                </a>
            </li>
            <!-- Add more sidebar items as needed -->
        </ul>
    </div>

    <div class="main-content" id="mainContent">
        <main class="mt-5 pt-3">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 mb-3">
                        <div class="card">
                            <div class="card-header">
                                <span><i class="bi bi-table me-2"></i></span> Users Table
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table id="example" class="table table-striped data-table" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th>S.No.</th>
                                                <th>Course Name</th>
                                                <th>Section</th>
                                                <th>Subsection</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <% int i=0; for(UserModel u : list) { i++; %>
                                        <tr>
                                        <td><%=i %></td>
                                        <td><%=u.getName() %></td>
                                        <td><%=u.getSection() %></td>
                                        <td>
                                        <a href="viewSubsection.jsp?id=<%=u.getCourseId() %>" class="btn btn-sm btn-success m-1" style="padding: 4px 8px;">View</a>
                                        </td>
                                        <td>
                                        <a href="edit.jsp?id=<%=u.getId() %>" class="btn btn-sm btn-success m-1" style="padding: 4px 8px;">Edit</a>
                                        <a href="../pages/action.jsp?id=<%=u.getId() %>&btn=deleteregistration" class="btn btn-sm btn-danger m-1" style="padding: 4px 8px;">Delete</a>
                                        </td>
                                        </tr>
                                        <%} %>
                                        </tbody>
                                        <tfoot>
					                      <tr>
					                        <th>S.No.</th>
                                            <th>Course Name</th>
                                            <th>Section</th>
                                            <th>Subsection</th>
                                            <th>Action</th>
					                      </tr>
					                    </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    

    <!-- Fixed Dropdown Menu -->
    <div id="fixedDropdown" class="fixed-dropdown">
        <a href="#">Action</a>
        <a href="#">Another action</a>
        <a href="#">Something else here</a>
        <hr>
        <div class="p-3">
            <a href="../index.jsp" class="btn has-before">
                <span class="span">Log out</span>
            </a>
        </div>
    </div>

    <!-- Custom JS -->
    <script src="../assets/js/script.js" defer></script>
    <script src="../assets/js/jquery.dataTables.min.js"></script>
    <script src="../assets/js/dataTables.bootstrap5.min.js"></script>

    <!-- Ionicons -->
    <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
    <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    <!-- Bootstrap JS and Popper.js -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz4fnFO9gybBogGzGSi1p6ypA5Wj9e1F2+c6pLrA6ujF6CPK5FvLHG0L2g"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-pprn3073KE6tl6j0v4eC8BQKhj6Uv7+An1z6k/rJ1qUqsdHRw8xzN1DaK6KM9c6"
        crossorigin="anonymous"></script>
        
        <script>
         document.addEventListener('DOMContentLoaded', () => {
            const userDropdown = document.getElementById('userDropdown');
            const fixedDropdown = document.getElementById('fixedDropdown');
            const sidebar = document.getElementById('sidebar');
            const mainContent = document.getElementById('mainContent');

            userDropdown.addEventListener('click', (e) => {
                e.preventDefault();
                fixedDropdown.classList.toggle('active');
            });

            // Close dropdown when clicking outside
            document.addEventListener('click', (e) => {
                if (!userDropdown.contains(e.target) && !fixedDropdown.contains(e.target)) {
                    fixedDropdown.classList.remove('active');
                }
            });
        });
        
    </script>
</body>
</html>