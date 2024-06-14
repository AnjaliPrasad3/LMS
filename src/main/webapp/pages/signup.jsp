<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 
    - custom css link
  -->
  <link rel="stylesheet" href="../assets/css/style.css">
</head>
<body>
    <section class="section hero has-bg-image" id="home" aria-label="home"
    style="background-image: url('../assets/images/hero-bg.svg')">
    <div class="container">
  
      <div class="hero-content">
  
        <div class="box" class="img-cover">
            <div class="col-10 col-lg-5">
                <form class="shadow rounded bg-body" method="post" action="action.jsp">
                    <h2 class="mb-4">Sign up</h2>
                    <div class="mb-3">
                      <label for="name_field" class="form-label">Name</label>
                      <input type="text" id="name_field" class="form-control" name="name" value="" />
                  </div>
                    <div class="mb-3">
                        <label for="email_field" class="form-label">Email</label>
                        <input type="email" id="email_field" class="form-control" name="email" value="" />
                    </div>
        
                    <div class="mb-3">
                        <label for="password_field" class="form-label">Password</label>
                        <input type="password" id="password_field" class="form-control" name="password" value="" />
                    </div>
        
                    <button style="width: 100%;" type="submit" name="btn" value="studentRegistration" class="btn has-before">
                        Signup
                    </button>
                </form>
            </div>
        </div>
  
      </div>
  
      <figure class="hero-banner">
  
        <div class="img-holder one" style="--width: 270; --height: 300;">
          <img src="../assets/images/hero-banner-1.jpg" width="270" height="300" alt="hero banner" class="img-cover">
        </div>
  
        <div class="img-holder two" style="--width: 240; --height: 370;">
          <img src="../assets/images/hero-banner-2.jpg" width="240" height="370" alt="hero banner" class="img-cover">
        </div>
  
        <img src="../assets/images/hero-shape-1.svg" width="380" height="190" alt="" class="shape hero-shape-1">
  
        <img src="../assets/images/hero-shape-2.png" width="622" height="551" alt="" class="shape hero-shape-2">
  
      </figure>
  
    </div>
  </section>
</body>
</html>

    