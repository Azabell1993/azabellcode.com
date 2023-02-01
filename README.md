# azabellcode.com
 
 개인적으로 운영하고 있는 블로그의 소스코드를 공개로 전환하였습니다.
 현업이 있기 때문에 천천히 하나씩 기능을 추가하는 중 입니다.

블로그의 취지는 WASM의 기술을 직접 블로그에 신연 및 공부를 하면서 정보를 공유하기 위해서 입니다.
 
 # DATABASE
 - mysql (Git Ignore File)
 src\main\resources\application.properties
 ```c
 project.name=azabellcodeblog

# LOCAL
server.port=8081
spring.datasource.url=jdbc:mysql://localhost:3306/db?useSSL=true&characterEncoding=UTF-8&serverTimezone=UTC

spring.freemarker.cache=false
spring.thymeleaf.cache=false

spring.thymeleaf.prefix=classpath:/templates/
spring.thymeleaf.suffix=.html
server.servlet.jsp.init-parameters.development=true

spring.datasource.username=
spring.datasource.password=
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

logging.level.org.springframework=debug
logging.level.org.springframework.web=debug

mybatis.mapper-locations=classpath:/mapper/**/*.xml
 ```
 
# HOW?
- DB : MySQL
- SERVER : Window11
- HTTPS : CloudFlare
- CLIENT : LINUX, WINDOW, MAC 
- WAR로 베포합니다.
``` 
dependencies {
	implementation 'org.springframework.boot:spring-boot-starter-jdbc'
	implementation 'org.springframework.boot:spring-boot-starter-thymeleaf'
	implementation 'nz.net.ultraq.thymeleaf:thymeleaf-layout-dialect'
	implementation 'org.springframework.boot:spring-boot-starter-web'
	implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:2.3.0'
	compileOnly 'org.projectlombok:lombok'
   	runtimeOnly 'com.mysql:mysql-connector-j'
	annotationProcessor 'org.projectlombok:lombok'
	providedRuntime 'org.springframework.boot:spring-boot-starter-tomcat'
	testImplementation 'org.springframework.boot:spring-boot-starter-test'
}
```

# 큰 틀
```html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" class="fontawesome-i2svg-active fontawesome-i2svg-complete">
<head>
    <title th:text="${site_title}">Template Title</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/fold.css" />
</head>
<body class="is-preload">

    <!-- Wrapper -->
        <div id="wrapper">

            <!-- Main -->
                <div id="main">
                    <div class="inner">
                        <div>
			<!-- Header -->
				<header id="header">
				<a th:href="@{/index}" class="logo"><strong>AZABELLCODE</strong> by Azabell1993</a>
				<ul class="icons">
					소스코드 바로가기 <li><a onclick="window.open('https://github.com/Azabell1993/ClangStructPointerExample')" class="icon brands fa-github"></a></li>
				</ul>
				</header>
						
			<!-- Banner -->
				<section id="banner">
					<div class="content">
					</div>
				</section>
			</div>
				
			<!-- insert main content -->
                        <th:block th:replace="/main/main_insert.html :: indexFragment"></th:block>
                        <div>
                        <section include-html="/main/foot.html"></section>
                    </div>
                    </div>
                </div>

                <div id="sidebar">
                    <div class="inner">
                        <th:block th:replace="/main/menu.html :: mennuFragment"></th:block>
                    </div>
                </div>
        </div>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/browser.min.js"></script>
        <script src="assets/js/breakpoints.min.js"></script>
        <script src="assets/js/util.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="assets/js/innerHTML.js"></script>
        <script src="assets/js/includeRouter.js"></script>
        
        <!-- add Scripts -->
        <script src="/assets/js/AddFunction.js"></script>
        
</body>
    <script>
    includeHTML( function () {
      includeRouter( function () {
        // do something in the future
      });
    });
    </script>
</html>
```

- 기본적으로 타임리프를 사용하면서 페이지 이동을 하였습니다.
```
<th:block th:replace="/main/main_insert.html :: indexFragment"></th:block>
```
- WASM 기술 사용도 잘 연동이 되는 예제를 보실 수 있습니다.
- 계속하여서 추가 예정 입니다.
https://github.com/Azabell1993/azabellcode.com/blob/f2fd97e43240f2a768ae57846bf30c87a0cf628e/src/main/resources/templates/main/main_insert.html#L4-L18
