#!/bin/bash

# wasm 디렉토리 생성
# mkdir -p /var/www/azabellcode.com/src/main/resources/templates/thymeleaf/wasm/

# minishell 디렉토리로 이동
cd /var/www/azabellcode.com/src/main/resources/templates/thymeleaf/minishell/

# Makefile clean 및 make 실행
make clean
make

# minishell 결과물을 wasm 폴더로 이동
# mv ./minishell /var/www/azabellcode.com/src/main/resources/templates/thymeleaf/wasm/minishell
cp ./run_command.js /var/www/html/daemon/run_command.js
mv ./run_command.js /var/www/azabellcode.com/src/main/resources/templates/thymeleaf/wasm/run_command.js
mv ./run_command.wasm /var/www/azabellcode.com/src/main/resources/templates/thymeleaf/wasm/run_command.wasm

# calculator 디렉토리로 이동
cd /var/www/azabellcode.com/src/main/resources/templates/thymeleaf/calculator/

# Makefile clean 및 make 실행
make clean
make

# calculator 결과물을 wasm 폴더로 이동
mv ./Calculator.js /var/www/azabellcode.com/src/main/resources/templates/thymeleaf/wasm/Calculator.js
mv ./Calculator.html /var/www/azabellcode.com/src/main/resources/templates/thymeleaf/wasm/Calculator.html
mv ./Calculator.wasm /var/www/azabellcode.com/src/main/resources/templates/thymeleaf/wasm/Calculator.wasm

# Gradle 빌드 및 실행
cd /var/www/azabellcode.com/
chmod +x ./gradlew

./gradlew build
./gradlew bootRun
