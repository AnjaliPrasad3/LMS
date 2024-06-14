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
    <title>All Courses</title>
    <!-- 
    - Bootstrap
  -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

  <!-- 
    - custom css link
  -->
  <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body>
<% List<UserModel> list = UserDaw.getCourse(); %>
    <!-- 
    - #HEADER
  -->

  <header class="header" data-header>
    <div class="container">

      <a href="../index.jsp" class="logo">
        <img src="../assets/images/logo.svg" width="162" height="50" alt="EduWeb logo">
      </a>

      <nav class="navbar" data-navbar>

        <div class="wrapper">
          <a href="#" class="logo">
            <img src="../assets/images/logo.svg" width="162" height="50" alt="EduWeb logo">
          </a>

          <button class="nav-close-btn" aria-label="close menu" data-nav-toggler>
            <ion-icon name="close-outline" aria-hidden="true"></ion-icon>
          </button>
        </div>

        <ul class="navbar-list">

          <li class="navbar-item">
            <a href="../index.jsp" class="navbar-link" data-nav-link>Home</a>
          </li>

          <li class="navbar-item">
            <a href="#home" class="navbar-link" data-nav-link>Categories</a>
          </li>
          
          <%
			if(session.getAttribute("role")!=null){
				if(session.getAttribute("role").equals("user")){
					
					%>
					
						<li class="navbar-item">
                                <a href="user/myCourses.jsp" class="navbar-link" data-nav-link>My Courses</a>
                        </li>
					
					<%
				}
			}
			%>

        </ul>

      </nav>

      <div class="header-actions">

        <button class="header-action-btn" aria-label="toggle search" title="Search">
          <ion-icon name="search-outline" aria-hidden="true"></ion-icon>
        </button>

        <button class="header-action-btn" aria-label="cart" title="Cart">
          <ion-icon name="cart-outline" aria-hidden="true"></ion-icon>

          <span class="btn-badge">0</span>
        </button>

        <%
			if(session.getAttribute("role")!=null){
				if(session.getAttribute("role").equals("user")){
					%>
					<span><%=session.getAttribute("name") %></span>
						<a href="action.jsp?btn=logout" class="btn has-before">
         						 <span class="span">Logout</span>
       						 </a>
					
					
					<%
					
				}else{
					%>
						<a href="signup.jsp" class="btn has-before">
        					  <span class="span">Sign up</span>
      					  </a>
				        <a href="login.jsp" class="btn has-before">
				          <span class="span">Log in</span>
				        </a>
						
					<%
					
				}
				
			}else{
				%>
				<a href="signup.jsp" class="btn has-before">
					  <span class="span">Sign up</span>
					  </a>
		        <a href="login.jsp" class="btn has-before">
		          <span class="span">Log in</span>
		        </a>
				
			<%
				
			}
		
		
		
		%>

        <button class="header-action-btn" aria-label="open menu" data-nav-toggler>
          <ion-icon name="menu-outline" aria-hidden="true"></ion-icon>
        </button>

      </div>

      <div class="overlay" data-nav-toggler data-overlay></div>

    </div>
  </header>

  <!-- 
    - #ALL COURSES
  -->

  <section class="section course" id="courses" aria-label="course">
    <div class="container">

      <p class="section-subtitle">Courses</p>
      <h2 class="h2 section-title">Let's start learning...</h2>

      <ul class="grid-list">
      <% int i=0; for(UserModel u : list) { i++; %>
        <li>
          <div class="course-card">

            <figure class="card-banner img-holder" style="--width: 370; --height: 220;">
              <img src="../admin/images/<%=u.getImg() %>" width="370" height="220" loading="lazy"
                alt="Build Responsive Real- World Websites with HTML and CSS" class="img-cover">
            </figure>

            <div class="abs-badge">
              <ion-icon name="time-outline" aria-hidden="true"></ion-icon>

              <span class="span"><%=u.getDuration() %> Weeks</span>
            </div>

            <div class="card-content">

              <span class="badge"><%=u.getLevel() %></span>

              <h3 class="h3">
                <a href="user/buyCourse.jsp?courseId=<%=u.getId()%>" class="card-title"><%=u.getName() %></a>
              </h3>

              <div class="wrapper">

                <div class="rating-wrapper">
                  <ion-icon name="star"></ion-icon>
                  <ion-icon name="star"></ion-icon>
                  <ion-icon name="star"></ion-icon>
                  <ion-icon name="star"></ion-icon>
                  <ion-icon name="star"></ion-icon>
                </div>

                <p class="rating-text">(<%=u.getRating() %>/5 Rating)</p>

              </div>

              <data class="price" value="29">$<%=u.getAmount() %></data>

              <ul class="card-meta-list">

                <li class="card-meta-item">
                  <ion-icon name="library-outline" aria-hidden="true"></ion-icon>

                  <span class="span">8 Lessons</span>
                </li>

                <li class="card-meta-item">
                  <ion-icon name="people-outline" aria-hidden="true"></ion-icon>

                  <span class="span">20 Students</span>
                </li>

              </ul>

            </div>

          </div>
        </li>
        <%} %>
      </ul>

    </div>
  </section>


  <!-- 
    - #FOOTER
  -->

  <footer class="footer" style="background-image: url('../../assets/images/footer-bg.png')">

    <div class="footer-top section">
      <div class="container grid-list">

        <div class="footer-brand">

          <a href="#" class="logo">
            <img src="../assets/images/logo-light.svg" width="162" height="50" alt="EduWeb logo">
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