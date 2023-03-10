<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" class="fontawesome-i2svg-active fontawesome-i2svg-complete">
<head>
    <title th:text="${site_title}">Template Title</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/fold.css" />
</head>
<body>
<nav id="menu">
    <header class="major">
        <h2>Menu</h2>
    </header>
    <ul>
        <li><a href="/index">GO TO HOME</a></li>
        <li><a href="/generic">THE STORY ABOUT C POINTER</a></li>
        <li><a href="/introduce">ABOUt BLOGGER</a></li>
        <li>
            <span class="opener">C</span>
            <ul>
                <li><a href="/oopClang">Procedural and object oriented</a></li>
                <li><a href="#">A story about object-like implementation in C language</a></li>
                <li><a href="#">Pointer Bible</a></li>
                <li><a href="#">Differences between C and C++</a></li>
            </ul>
        </a></li>
        <li>
            <span class="opener">C++</span>
            <ul>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
            </ul>
        </a></li>
        <li>
            <span class="opener">ASSEMBLY</span>
            <ul>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
            </ul>
        </a></li>
        <li>
            <span class="opener">JS</span>
            <ul>
                <li><a href="#">.wasm과 JS</a></li>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
            </ul>
        </a></li>
        <li>
            <span class="opener">Unity</span>
            <ul>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
            </ul>
        </a></li>
        <li>
            <span class="opener">WASM MAPPING SPACE</span>
            <ul>
                <li><a th:href="@{/editproduct}">TEST BASIC SAMPLE</a></li>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
            </ul>
        </a></li>
        <li>
            <span class="opener">PORTFOLIO</span>
            <ul>
                <li><a href="#">GITHUB BY TOPIC</a></li>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
            </ul>
        </a></li>
        <li>
            <span class="opener">TALK ABOUT OTHER LAGNAGUES</span>
            <ul>
                <li><a href="#">C#</a></li>
                <li><a href="#">Java</a></li>
                <li><a href="#">go</a></li>
                <li><a href="#">Rust</a></li>
                <li><a href="#">etc..</a></li>
            </ul>
        </a></li>
        <li>
            <span class="opener">CHAT</span>
            <ul>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
                <li><a href="#">Waiting...</a></li>
            </ul>
        </a></li>
        <li>
            <span class="opener">MEMOIR BY YEAR</span>
            <ul>
                <li><a href="#">2023</a></li>
                <li><a href="#">2024</a></li>
                <li><a href="#">2025</a></li>
                <li><a href="#">2026</a></li>
                <li><a href="#">2027</a></li>
                <li><a href="#">2028</a></li>
                <li><a href="#">2029</a></li>
                <li><a href="#">2030</a></li>
            </ul>
        </a></li>
        <li><a href="/board/openBoardList.do">NOTICE</a></li>
    </ul>
</nav>
<!-- Section -->

    <!-- Section -->
    <section>
        <header class="major">
            <h1></h1>
            <h2>CONNECT</h2>
        </header>
        <ul class="contact">
            <li class="icon solid fa-envelope">jeewoo19930315@gmail.com</li>
        </ul>
    </section>

    <!-- Footer -->
    <footer id="footer">
        <p class="copyright">&copy; Azaebll1993 </p>
    </footer>
</body>