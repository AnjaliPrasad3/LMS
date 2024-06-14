<%@page import="com.lms.UserDaw.UserDaw"%>
<%@page import="com.lms.UserModel.UserModel"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Structure</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="../assets/css/style.css">

</head>
<% List<UserModel> list = UserDaw.getCourse(); %>
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
                <a class="nav-link" href="users.jsp">
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

<body>
<div class="main-content" id="mainContent">
    <main class="mt-5 pt-3">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-12">
            <div class="container-fluid">
              <div class="row">
                <div class="col-md-12 mb-3">
                  <div class="card">
                    <div class="card-header">
                      <span><i class="bi bi-table me-2"></i></span> Add Course
                    </div>
                    <div class="card-body">
                      <div class="table-responsive">
                        <form method="post" action="./actionto.jsp" enctype="multipart/form-data">
                                <div class="mb-3">
                                <div class="row">
                                <div class="col-sm-9 p-3">
                                <select class="form-control" name="courseId"style="font-size: 2rem;">
                                        <option selected>Choose Course...</option>
                                        <% for(UserModel u : list) { %>
                                        <option value="<%= u.getId() %>"><%= u.getName() %></option>
                                        <% } %>
                                    </select>
                                </div>
                                <div class="col-3 p-3 mb-2">
                                <a href="viewCourseStructure.jsp" class="btn has-before">
							          <span class="span">View Course Structure</span>
							        </a>
                                </div>
                                </div>
                                </div>
                                    
                                <div id="sections-container" class="container text-center">
                                    <div class="section">
                                        <div class="row align-items-center mb-3">
                                            <div class="col">
                                                <label for="section_1" class="form-label">Section</label>
                                                <input type="text" id="section_1" class="form-control form-control-lg" name="section" />
                                            </div>
                                            
                                        </div>
                                        <div class="subsections-container container text-center mb-3">
                                            <div class="row align-items-center">
                                                <div class="col">
                                                    <label for="subsection_1_1" class="form-label">Subsection</label>
                                                    <input type="text" id="subsection_1_1" class="form-control form-control-lg" name="subsection[]" />
                                                </div>
                                                <div class="col">
                                                    <label for="subsection_file_1_1" class="form-label">Subsection Image</label>
                                                    <input type="file" id="subsection_file_1_1" class="form-control form-control-lg" name="subsection_file_1[]" />
                                                </div>
                                                <div class="col">
                                                    <button type="button" class="btn btn-success add-subsection">+</button>
                                                </div>
                                                <div class="col">
                                                    <button type="button" class="btn btn-danger remove-subsection">-</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block" name="btnCourse" value="addCourseStructure">Submit</button>
                            </form>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
</div>

<!-- PLUS | MINUS BUTTON -->
<script>
document.addEventListener('DOMContentLoaded', function () {
    let sectionCount = 1;

    document.querySelector('#sections-container').addEventListener('click', function (e) {
        if (e.target.classList.contains('add-section')) {
            sectionCount++;
            const newSection = document.createElement('div');
            newSection.classList.add('section', 'mb-3');
            newSection.innerHTML = `
                <div class="row align-items-center">
                    <div class="col">
                        <label for="section_${sectionCount}" class="form-label">Section ${sectionCount}</label>
                        <input type="text" id="section" class="form-control form-control-lg" name="section" />
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-success add-section">+</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-danger remove-section">-</button>
                    </div>
                </div>
                <div class="subsections-container container text-center mb-3">
                    <div class="row align-items-center">
                        <div class="col">
                            <label for="subsection_${sectionCount}_1" class="form-label">Subsection 1</label>
                            <input type="text" id="subsection_${sectionCount}_1" class="form-control form-control-lg" name="subsection[]" />
                        </div>
                        <div class="col">
                            <label for="subsection_file_${sectionCount}_1" class="form-label">Subsection Image</label>
                            <input type="file" id="subsection_file_${sectionCount}_1" class="form-control form-control-lg" name="subsection_file_${sectionCount}[]" />
                        </div>
                        <div class="col">
                            <button type="button" class="btn btn-success add-subsection">+</button>
                        </div>
                        <div class="col">
                            <button type="button" class="btn btn-danger remove-subsection">-</button>
                        </div>
                    </div>
                </div>
            `;
            document.querySelector('#sections-container').appendChild(newSection);
        }

        if (e.target.classList.contains('remove-section')) {
            const section = e.target.closest('.section');
            if (section) {
                section.remove();
            }
        }

        if (e.target.classList.contains('add-subsection')) {
            const section = e.target.closest('.section');
            if (section) {
                const subsectionsContainer = section.querySelector('.subsections-container');
                const subsectionCount = subsectionsContainer.querySelectorAll('.row').length + 1;
                const sectionIndex = Array.from(document.querySelectorAll('.section')).indexOf(section) + 1;

                const newSubsection = document.createElement('div');
                newSubsection.classList.add('row', 'align-items-center');
                newSubsection.innerHTML = `
                    <div class="col">
                        <label for="subsection_${sectionIndex}_${subsectionCount}" class="form-label">Subsection ${subsectionCount}</label>
                        <input type="text" id="subsection_${sectionIndex}_${subsectionCount}" class="form-control form-control-lg" name="subsection[]" />
                    </div>
                    <div class="col">
                        <label for="subsection_file_${sectionIndex}_${subsectionCount}" class="form-label">Subsection Image</label>
                        <input type="file" id="subsection_file_${sectionIndex}_${subsectionCount}" class="form-control form-control-lg" name="subsection_file_${sectionIndex}[]" />
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-success add-subsection">+</button>
                    </div>
                    <div class="col">
                        <button type="button" class="btn btn-danger remove-subsection">-</button>
                    </div>
                `;
                subsectionsContainer.appendChild(newSubsection);
            }
        }

        if (e.target.classList.contains('remove-subsection')) {
            const subsectionRow = e.target.closest('.row');
            if (subsectionRow) {
                subsectionRow.remove();
            }
        }
    });
});
</script>

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
    integrity="sha384-pprn3073KE6tl6j0v4eC8BQKhj6Uv7+An1z6k/rJ1QqsdHRw8xzN1DaK6KM9c6"
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