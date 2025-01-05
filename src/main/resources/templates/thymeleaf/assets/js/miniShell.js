const SERVER_URL = "http://10.211.55.11:5000/execute";
const outputElement = document.getElementById('output');
const commandInput = document.getElementById('command');

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