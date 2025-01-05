# C 및 WebAssembly 관련 설정
CC = gcc
CC_WASM = emcc
CFLAGS = -Wall -Wextra -O2
CFLAGS_WASM = -Wall -Wextra -s WASM=1 \
              -s EXPORTED_FUNCTIONS='["_run_command", "_validate_command", "_command_parse"]' \
              -s EXPORTED_RUNTIME_METHODS='["ccall", "cwrap", "UTF8ToString"]' \
              -O2

# 대상 파일
TARGET_JS = run_command.js
TARGET_WASM = minishell.wasm
TARGET_EXEC = minishell

# WebAssembly에 필요한 모든 소스 파일
WASM_SRC = is_bultin.c parsing.c run_command.c validate_command.c

# 기본 목표
all: $(TARGET_JS) $(TARGET_EXEC)

# WebAssembly 빌드
$(TARGET_JS): $(WASM_SRC)
	$(CC_WASM) $(CFLAGS_WASM) -o $(TARGET_JS) $^

# 실행 파일 빌드
$(TARGET_EXEC): main.c is_bultin.c run_command.c validate_command.c parsing.c
	$(CC) $(CFLAGS) -o $(TARGET_EXEC) main.c is_bultin.c run_command.c validate_command.c parsing.c

# 클린 명령
clean:
	rm -f *.js *.wasm $(TARGET_EXEC)
