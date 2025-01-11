#!/bin/bash

# Emscripten 설치 스크립트

# 스크립트 실행 중 오류 발생 시 중단
echo "[INFO] 스크립트 실행 중..."
set -e

# Emscripten 설치를 위한 디렉토리 설정
EMSDK_DIR="$HOME/emsdk"

# 필요한 패키지 설치
sudo apt update
sudo apt install -y git cmake python3 python3-pip curl build-essential

# Emscripten 설치 디렉토리로 이동 또는 생성
if [ ! -d "$EMSDK_DIR" ]; then
  echo "[INFO] Emscripten SDK 디렉토리 생성 중: $EMSDK_DIR"
  git clone https://github.com/emscripten-core/emsdk.git "$EMSDK_DIR"
else
  echo "[INFO] 기존 EMSDK 디렉토리가 감지되었습니다. 업데이트 진행 중..."
  cd "$EMSDK_DIR"
  git pull
fi

# Emscripten 설치 및 활성화
cd "$EMSDK_DIR"
./emsdk install latest
./emsdk activate latest

# 환경 변수 설정
if ! grep -q "source $EMSDK_DIR/emsdk_env.sh" ~/.bashrc; then
  echo "[INFO] 환경 변수를 .bashrc에 추가 중..."
  echo "source $EMSDK_DIR/emsdk_env.sh" >> ~/.bashrc
else
  echo "[INFO] .bashrc에 이미 Emscripten 환경 변수가 설정되어 있습니다."
fi

# 변경 사항 반영
source ~/.bashrc

# 설치 완료 메시지 출력
echo "[INFO] Emscripten 설치 완료!"
echo "[INFO] 사용 준비 완료. 필요한 경우 새로운 쉘에서 실행하세요."