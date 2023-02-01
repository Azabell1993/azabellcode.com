# azabellcode.com
 
 개인적으로 운영하고 있는 블로그의 소스코드를 공개로 전환하였습니다.
 현업이 있기 때문에 천천히 하나씩 기능을 추가하는 중 입니다.

블로그의 취지는 WASM의 기술을 직접 블로그에 신연 및 공부를 하면서 정보를 공유하기 위해서 입니다.
 
 # DataBase 
 - mysql
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
