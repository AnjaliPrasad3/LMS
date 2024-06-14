<%@page import="com.lms.UserDaw.UserDaw"%>
<%@page import="com.lms.UserModel.UserModel"%>
<%@page import="java.util.List"%>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Courses</title>

  <!-- 
    - favicon
  -->
  <link rel="shortcut icon" href="../../favicon.svg" type="image/svg+xml">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />


  <link rel="stylesheet" href="../../assets/css/style.css">
</head>

<body>

<%
int courseId = Integer.parseInt(request.getParameter("id"));
List<UserModel> list = UserDaw.getCourseStructureById(courseId);
%>
  <header class="header" data-header>
    <div class="container">
      <a href="../../index.jsp" class="logo">
        <img src="../../assets/images/logo.svg" width="162" height="50" alt="EduWeb logo">
      </a>

      <div class="header-actions">
        <a href="./pages/login.html" class="btn has-before">
          <span class="span">Share</span>
        </a>
      </div>
    </div>
  </header>

  <main>
    <section>
      <div class="video">
	    <video id="courseVideo" width="100%" height="auto" controls>
	      <source src="movie.mp4" type="video/mp4">
	    </video>
	  </div>      
    </section>

    <section class="container">
      <nav class="navbar">
        <ul class="navbar-list">

          <li class="navbar-item">
            <a href="#" class="navbar-link" onclick="changeContent('coursecontent')" data-nav-link>Course Content</a>
          </li>

          <li class="navbar-item">
            <a href="#" class="navbar-link" onclick="changeContent('overview')" data-nav-link>Overview</a>
          </li>

          <li class="navbar-item">
            <a href="#" class="navbar-link" onclick="changeContent('q&a')" data-nav-link>Q&A</a>
          </li>

          <li class="navbar-item">
            <a href="#" class="navbar-link" onclick="changeContent('notes')" data-nav-link>Notes</a>
          </li>

          <li class="navbar-item">
            <a href="#" class="navbar-link" onclick="changeContent('reviews')" data-nav-link>Reviews</a>
          </li>

        </ul>
      </nav>
    </section>

    <hr>

    <section>
      <div class="Coursecontainer">
        <div id="dynamicContent">
          <!-- dynamic content -->
          <nav class="coursebar">
            <ul class="course-list">
            <% int i=0; for(UserModel u : list) { i++; 
			  String jsonSubSection = u.getSubSection();
			  String jsonFileNames = u.getVideo();
			
			  // Parse JSON strings
			  JSONArray subSectionsArray = new JSONArray(jsonSubSection);
			  JSONArray fileNamesArray = new JSONArray(jsonFileNames);
			%>
			<li class="course-item">
			  <a  class="course-link" onclick="showSubsections('section<%=i %>')"><%=u.getSection() %></a>
			  <ul id="section<%=i %>Subsections" style="display: none;">
			  <%
			    for (int j = 0; j < subSectionsArray.length(); j++) {
			      String subSection = subSectionsArray.getString(j);
			      String fileName = fileNamesArray.getString(j);
			  %>
			    <li><a href="../../admin/images/<%=fileName %>" class="navbar-link" onclick="changeVideo('<%=fileName %>'); event.preventDefault();"><%= subSection %></a></li>
			    <% 
			    }
			  %>
			  </ul>
			</li>
			<% } %>

            </ul>
          </nav>

        </div>
      </div>
    </section>

  </main>


  <!-- 
    - #FOOTER
  -->

  <footer class="footer" style="background-image: url('../../assets/images/footer-bg.png')">

    <div class="footer-top section">
      <div class="container grid-list">

        <div class="footer-brand">

          <a href="#" class="logo">
            <img src="../../assets/images/logo-light.svg" width="162" height="50" alt="EduWeb logo">
          </a>

          <p class="footer-brand-text">
            Lorem ipsum dolor amet consecto adi pisicing elit sed eiusm tempor incidid unt labore dolore.
          </p>

          <div class="wrapper">
            <span class="span">Add:</span>

            <address class="address">70-80 Upper St Norwich NR2</address>
          </div>

          <div class="wrapper">
            <span class="span">Call:</span>

            <a href="tel:+011234567890" class="footer-link">+01 123 4567 890</a>
          </div>

          <div class="wrapper">
            <span class="span">Email:</span>

            <a href="mailto:info@eduweb.com" class="footer-link">info@eduweb.com</a>
          </div>

        </div>

        <ul class="footer-list">

          <li>
            <p class="footer-list-title">Online Platform</p>
          </li>

          <li>
            <a href="#" class="footer-link">About</a>
          </li>

          <li>
            <a href="#" class="footer-link">Courses</a>
          </li>

          <li>
            <a href="#" class="footer-link">Instructor</a>
          </li>

          <li>
            <a href="#" class="footer-link">Events</a>
          </li>

          <li>
            <a href="#" class="footer-link">Instructor Profile</a>
          </li>

          <li>
            <a href="#" class="footer-link">Purchase Guide</a>
          </li>

        </ul>

        <ul class="footer-list">

          <li>
            <p class="footer-list-title">Links</p>
          </li>

          <li>
            <a href="#" class="footer-link">Contact Us</a>
          </li>

          <li>
            <a href="#" class="footer-link">Gallery</a>
          </li>

          <li>
            <a href="#" class="footer-link">News & Articles</a>
          </li>

          <li>
            <a href="#" class="footer-link">FAQ's</a>
          </li>

          <li>
            <a href="#" class="footer-link">Sign In/Registration</a>
          </li>

          <li>
            <a href="#" class="footer-link">Coming Soon</a>
          </li>

        </ul>

        <div class="footer-list">

          <p class="footer-list-title">Contacts</p>

          <p class="footer-list-text">
            Enter your email address to register to our newsletter subscription
          </p>

          <form action="" class="newsletter-form">
            <input type="email" name="email_address" placeholder="Your email" required class="input-field">

            <button type="submit" class="btn has-before">
              <span class="span">Subscribe</span>

              <ion-icon name="arrow-forward-outline" aria-hidden="true"></ion-icon>
            </button>
          </form>

          <ul class="social-list">

            <li>
              <a href="#" class="social-link">
                <ion-icon name="logo-facebook"></ion-icon>
              </a>
            </li>

            <li>
              <a href="#" class="social-link">
                <ion-icon name="logo-linkedin"></ion-icon>
              </a>
            </li>

            <li>
              <a href="#" class="social-link">
                <ion-icon name="logo-instagram"></ion-icon>
              </a>
            </li>

            <li>
              <a href="#" class="social-link">
                <ion-icon name="logo-twitter"></ion-icon>
              </a>
            </li>

            <li>
              <a href="#" class="social-link">
                <ion-icon name="logo-youtube"></ion-icon>
              </a>
            </li>

          </ul>

        </div>

      </div>
    </div>

    <div class="footer-bottom">
      <div class="container">

        <p class="copyright">
          Copyright 2022 All Rights Reserved by <a href="#" class="copyright-link">codewithsadee</a>
        </p>

      </div>
    </div>

  </footer>

  <!-- 
    - custom js link
  -->
  <script src="../../assets/js/script.js" defer></script>
  <!-- 
    - ionicon link
  -->
  <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
  <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

</body>

</html>