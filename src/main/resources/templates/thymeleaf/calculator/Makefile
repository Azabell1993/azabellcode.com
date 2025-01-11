# 경로 설정
WASM_WORKSPACE = .
WASM_SRC = $(WASM_WORKSPACE)/calculator.c
WASM_OUT = $(WASM_WORKSPACE)/Calculator
SHELL_TEMPLATE = /var/www/azabellcode.com/src/main/resources/templates/thymeleaf/html_template/shell_minishell.html

# EMCC 설정
EMCC = emcc
WASM_FLAGS = -s WASM=1 -o $(WASM_OUT).html \
             --shell-file $(SHELL_TEMPLATE) \
             -s EXPORTED_FUNCTIONS='["_SUM", "_SelectFunc", "_CallCalc"]' \
             -s EXPORTED_RUNTIME_METHODS='["ccall", "cwrap", "UTF8ToString"]' \
             -s NO_EXIT_RUNTIME=1

# 규칙 정의
.PHONY: all clean

all: $(WASM_OUT).html $(WASM_OUT).wasm

$(WASM_OUT).html $(WASM_OUT).wasm: $(WASM_SRC)
	$(EMCC) $(WASM_SRC) $(WASM_FLAGS)

clean:
	rm -f $(WASM_WORKSPACE)/Calculator.html
	rm -f $(WASM_WORKSPACE)/Calculator.wasm
