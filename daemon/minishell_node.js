const fs = require("fs");
const https = require("https");
const http = require("http");
const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const { exec } = require("child_process");
const Module = require("/var/www/html/minishell/run_command.js");

const app = express();

// CORS 옵션 설정
const corsOptions = {
    origin: "*", // 모든 도메인 허용
    methods: "GET,POST,PUT,DELETE,OPTIONS",
    allowedHeaders: "Content-Type,Authorization",
};

// CORS 및 JSON 바디 파싱 설정
app.use(cors(corsOptions));
app.use(bodyParser.json());

// WebAssembly 모듈 초기화
let runCommand;
try {
    runCommand = Module.cwrap("_run_command", "string", ["array"]);
    console.log("minishell.js WebAssembly module initialized.");
} catch (error) {
    console.error("Failed to initialize WebAssembly:", error);
    process.exit(1);
}

// POST /execute 핸들러
app.post("/execute", (req, res) => {
    const { command } = req.body;
    if (!command) {
        return res.status(400).json({ error: "No command provided." });
    }

    console.log(`Received command: ${command}`);
    exec(command, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error executing command: ${error.message}`);
            return res.json({ output: `Error: ${stderr || error.message}`, status: 1 });
        }
        console.log(`Command output: ${stdout}`);
        res.json({ output: stdout, status: 0 });
    });
});

// HTTP 서버 실행 (개발용)
http.createServer(app).listen(5000, () => {
    console.log("HTTP Server running on http://10.211.55.11:5000");
});

// // HTTPS 서버 실행 (운영용)
// const httpsOptions = {
//     key: fs.readFileSync("./AppTest.key"),
//     cert: fs.readFileSync("./AppTest.crt"),
// };

// https.createServer(httpsOptions, app).listen(5443, () => {
//     console.log("HTTPS Server running on https://localhost:5443");
// });

