'use strict';



/**
 * add event on element
 */

const addEventOnElem = function (elem, type, callback) {
  if (elem.length > 1) {
    for (let i = 0; i < elem.length; i++) {
      elem[i].addEventListener(type, callback);
    }
  } else {
    elem.addEventListener(type, callback);
  }
}



/**
 * navbar toggle
 */

const navbar = document.querySelector("[data-navbar]");
const navTogglers = document.querySelectorAll("[data-nav-toggler]");
const navLinks = document.querySelectorAll("[data-nav-link]");
const overlay = document.querySelector("[data-overlay]");

const toggleNavbar = function () {
  navbar.classList.toggle("active");
  overlay.classList.toggle("active");
}

addEventOnElem(navTogglers, "click", toggleNavbar);

const closeNavbar = function () {
  navbar.classList.remove("active");
  overlay.classList.remove("active");
}

addEventOnElem(navLinks, "click", closeNavbar);



/**
 * header active when scroll down to 100px
 */

const header = document.querySelector("[data-header]");
const backTopBtn = document.querySelector("[data-back-top-btn]");

const activeElem = function () {
  if (window.scrollY > 100) {
    header.classList.add("active");
    backTopBtn.classList.add("active");
  } else {
    header.classList.remove("active");
    backTopBtn.classList.remove("active");
  }
}

addEventOnElem(window, "scroll", activeElem);


/**
 * course functionality
 */

// Function to show subsections
function showSubsections(sectionId) {
  var subsections = document.getElementById(sectionId + 'Subsections');
  if (subsections) {
    subsections.style.display = subsections.style.display === 'none' ? 'block' : 'none';
  }
}

// Function to change video
function changeVideo(videoSrc) {
  var video = document.getElementById('courseVideo');
  if (video) {
    var source = video.querySelector('source');
    source.src = "/lms/admin/images/"+videoSrc;
    video.load();
    video.play();
  }
}



function changeContent(targetSection) {
  const dynamicContent = document.getElementById('dynamicContent');

  // Update dynamic content based on the clicked section
  switch (targetSection) {
    
        case 'overview':
          dynamicContent.innerHTML = `
      <h1>About This Course</h1>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Eos non eligendi sunt libero culpa ex, maxime laborum odit? Sequi nesciunt quod odit ipsam fugit unde consequatur quas culpa, possimus est necessitatibus aperiam facere eum voluptates beatae facilis, eveniet exercitationem veritatis reprehenderit commodi. Unde rerum esse nobis repudiandae ex libero eius, itaque ducimus minima sapiente? Culpa odio debitis, deserunt obcaecati perferendis velit ut iusto quas! Mollitia cumque consequatur pariatur quae optio, quos esse repellat in, non ipsa earum est ad ipsum rerum quia fuga deleniti libero animi sed ex excepturi! Delectus maxime iste sint provident doloribus voluptas accusamus harum autem dolor.</p>
      `;
          break;
        case 'q&a':
          dynamicContent.innerHTML = `
      <div class="search-box">
      <input type="text" placeholder="Search all course questions" class="search-input">
      <button type="button" class="search-button">Search</button>
      </div>
      <a href=""><b>Ask a new Question</b></a>
      `;
          break;
        case 'notes':
          dynamicContent.innerHTML = `
      <div class="search-box">
      <input type="text" placeholder="Create a new note" class="search-input">
      <button type="button" class="search-button">➕</button>
      </div>
      `;
          break;
        case 'reviews':
          dynamicContent.innerHTML = `
      <div class="reviewContainer">
      <div class="post">
        <div class="text">Thanks for rating us!</div>
        <div class="edit">EDIT</div>
      </div>
      <div class="star-widget">
        <input type="radio" name="rate" id="rate-5">
        <label for="rate-5" class="fas fa-star"></label>
        <input type="radio" name="rate" id="rate-4">
        <label for="rate-4" class="fas fa-star"></label>
        <input type="radio" name="rate" id="rate-3">
        <label for="rate-3" class="fas fa-star"></label>
        <input type="radio" name="rate" id="rate-2">
        <label for="rate-2" class="fas fa-star"></label>
        <input type="radio" name="rate" id="rate-1">
        <label for="rate-1" class="fas fa-star"></label>
        <form action="#">
          <header></header>
          <div class="textarea">
            <textarea cols="30" placeholder="Describe your experience.."></textarea>
          </div>
          <div class="review-btn">
            <button type="submit">Post</button>
          </div>
        </form>
      </div>
    </div>
    <script>
      const btn = document.querySelector("button");
      const post = document.querySelector(".post");
      const widget = document.querySelector(".star-widget");
      const editBtn = document.querySelector(".edit");
      btn.onclick = ()=>{
        widget.style.display = "none";
        post.style.display = "block";
        editBtn.onclick = ()=>{
          widget.style.display = "block";
          post.style.display = "none";
        }
        return false;
      }
</script>
`;
          break;
        default:
          dynamicContent.innerHTML = `
<nav class="coursebar">
<ul class="course-list">
  <li class="course-item">
    <a href="#coursecontent" class="course-link" onclick="showSubsections('section1')">Content1</a>
    <ul id="section1Subsections" style="display: none;">
      <li><a href="#" class="navbar-link" onclick="changeVideo('movie1.mp4')">Subsection 1.1</a></li>
      <li><a href="#" class="navbar-link" onclick="changeVideo('movie2.mp4')">Subsection 1.2</a></li>
      <!-- Add more subsections as needed -->
    </ul>
  </li>
  <li class="course-item">
    <a href="#coursecontent" class="course-link" onclick="showSubsections('section2')">Content2</a>
    <ul id="section2Subsections" style="display: none;">
      <li><a href="#" class="navbar-link" onclick="changeVideo('movie1.mp4')">Subsection 2.1</a></li>
      <li><a href="#" class="navbar-link" onclick="changeVideo('movie2.mp4')">Subsection 2.2</a></li>
    </ul>
  </li>
  <li class="course-item">
    <a href="#coursecontent" class="course-link" onclick="showSubsections('section3')">Content3</a>
    <ul id="section3Subsections" style="display: none;">
      <li><a href="#" class="navbar-link" onclick="changeVideo('movie1.mp4')">Subsection 3.1</a></li>
      <li><a href="#" class="navbar-link" onclick="changeVideo('movie2.mp4')">Subsection 3.2</a></li>
    </ul>
  </li>
</ul>
</nav>
`;
  }
}

