#!/bin/bash

source ~/.bashrc

# 현재 프로젝트 디렉토리 설정 (스크립트가 실행되는 현재 위치)
PROJECT_DIR="$PWD"

# wasm 디렉토리 생성
mkdir -p "${PROJECT_DIR}/src/main/resources/templates/thymeleaf/wasm/"

# calculator 디렉토리 확인 및 이동
CALCULATOR_DIR="${PROJECT_DIR}/src/main/resources/templates/thymeleaf/calculator"
if [ -d "$CALCULATOR_DIR" ]; then
    echo "Processing calculator..."
    cd "$CALCULATOR_DIR"

    
    # Makefile이 있는지 확인
    if [ -f "Makefile" ]; then
        make clean
        make
        
        # 결과물이 있는지 확인하고 이동
        if [ -f "./Calculator.js" ]; then
            mv ./Calculator.js "${PROJECT_DIR}/src/main/resources/templates/thymeleaf/wasm/"
        fi
        if [ -f "./Calculator.html" ]; then
            mv ./Calculator.html "${PROJECT_DIR}/src/main/resources/templates/thymeleaf/wasm/"
        fi
        if [ -f "./Calculator.wasm" ]; then
            mv ./Calculator.wasm "${PROJECT_DIR}/src/main/resources/templates/thymeleaf/wasm/"
        fi
    else
        echo "No Makefile found in calculator directory"
    fi
else
    echo "Calculator directory not found: $CALCULATOR_DIR"
fi

# 현재 프로젝트 디렉토리로 이동하여 Gradle 빌드 및 실행
cd "$PROJECT_DIR"
chmod +x ./gradlew

echo "Building and running the application..."
export JAVA_OPTS="-Djava.net.preferIPv4Stack=true"
./gradlew clean bootWar -x test
echo "Application built successfully!"

# 애플리케이션 실행 (백그라운드)
echo "Starting application on port 8081..."
java -jar build/libs/ROOT.war --server.port=8081 &
echo "Application started! Access at http://localhost:8081"
