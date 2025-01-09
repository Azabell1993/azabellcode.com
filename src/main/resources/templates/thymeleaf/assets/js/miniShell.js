const SERVER_URL = "http://192.168.0.14:5000/execute"; // 기본 서버 URL
const outputElement = document.getElementById('output');
const commandInput = document.getElementById('command');

// HTTPS 여부를 확인하고 경고 표시
document.addEventListener("DOMContentLoaded", () => {
    const warning = document.getElementById("https-warning");

    if (location.protocol !== "https:") {
        // HTTPS가 아닌 경우 경고 표시
        if (warning) {
            warning.style.display = "block";
        }
        console.error("This site requires HTTPS to use Mini Shell commands.");
    } else {
        // HTTPS인 경우 경고 숨기기
        if (warning) {
            warning.style.display = "none";
        }
    }
});

commandInput.addEventListener('keydown', (e) => {
    if (e.key === 'Enter') {
        const command = commandInput.value.trim();
        if (command) {
            sendWasmCommand(command);
        }

        if (command.toLowerCase() === "clear") {
            clearOutput();
        }
        commandInput.value = '';
    }
});

function sendWasmCommand(command) {
    outputElement.textContent += `$ ${command}\n`;

    fetch(SERVER_URL, {
        method: "POST",
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({ command }),
    })
        .then((response) => {
            if (!response.ok) {
                throw new Error(`HTTP error! Status: ${response.status}`);
            }
            return response.json();
        })
        .then((data) => {
            if (data.output) {
                const filteredOutput = data.output
                    .replace(/Error: TERM environment variable not set/g, 'Welcome to Mini Shell. Type your command below\n')
                    .replace(/^\.$/gm, '')
                    .trim();
                outputElement.textContent += `${filteredOutput}\n`;
            } else {
                outputElement.textContent += `[Error]: ${data.error || "Unknown error"}\n`;
            }
            scrollToBottom();
        })
        .catch((error) => {
            console.error("Fetch error:", error);
            outputElement.textContent += `[Error]: ${error.message}\n`;
            scrollToBottom();
        });
}

function scrollToBottom() {
    const terminal = document.getElementById('terminal');
    terminal.scrollTop = terminal.scrollHeight;
}

function clearOutput() {
    outputElement.textContent = "";
    scrollToBottom();
}

document.addEventListener('DOMContentLoaded', () => {
    outputElement.textContent = "Welcome to Mini Shell. Type your command below.\n\n";
    scrollToBottom();
});