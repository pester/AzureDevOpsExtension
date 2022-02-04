import tl = require("azure-pipelines-task-lib/task");
import { basename } from "path";

import {
    logInfo,
    logError,
    getSystemAccessToken
}  from "./agentSpecific";

export async function run() {
    try {

        let TestFolder = tl.getInput("TestFolder");
        let resultsFile = tl.getInput("resultsFile");
        let run32Bit = tl.getInput("run32Bit");
        let additionalModulePath = tl.getInput("additionalModulePath");
        let Tag = tl.getInput("Tag");
        let ExcludeTag = tl.getInput("ExcludeTag");
        let CodeCoverageOutputFile = tl.getInput("CodeCoverageOutputFile");
        let CodeCoverageFolder = tl.getInput("CodeCoverageFolder");
        let ScriptBlock = tl.getInput("ScriptBlock");
        let PesterVersion = tl.getInput("PesterVersion");
        let FailOnStdErr = tl.getInput("failOnStdErr");

        let TargetPesterVersion = "0.0.0";
        if (PesterVersion === "OtherVersion") {
            TargetPesterVersion = tl.getInput("TargetPesterVersion");
            if (!TargetPesterVersion.match(/\d+\.\d+\.\d+/g)) {
                logError(`Invalid version number provided for Pester. Please ensure it is in the format x.y.z`);
            }
        }

        // we need to get the verbose flag passed in as script flag
        var verbose = (tl.getVariable("System.Debug") === "true");

        // find the executeable
        let executable = "pwsh";
        if (tl.getVariable("AGENT.OS") === "Windows_NT") {
            if (!tl.getBoolInput("usePSCore")) {
                executable = "powershell.exe";
            }
            logInfo(`Using executable '${executable}'`);
        } else {
            logInfo(`Using executable '${executable}' as only only option on '${tl.getVariable("AGENT.OS")}'`);
        }

        // we need to not pass the null param
        var args = ['"' + __dirname + "/Pester.ps1" + '"',
                    "-TestFolder", TestFolder,
                    "-resultsFile", resultsFile,
                    "-run32Bit", run32Bit,
                    "-FailOnStdErr", FailOnStdErr,
                ];

        if (additionalModulePath) {
            args.push("-additionalModulePath");
            args.push(additionalModulePath);
        }

        if (Tag) {
            args.push("-Tag");
            args.push(Tag);
        }

        if (ExcludeTag) {
            args.push("-ExcludeTag");
            args.push(ExcludeTag);
        }

        if (CodeCoverageOutputFile) {
            args.push("-CodeCoverageOutputFile");
            args.push(CodeCoverageOutputFile);
        }

        if (CodeCoverageFolder) {
            args.push("-CodeCoverageFolder");
            args.push(CodeCoverageFolder);
        }

        if (ScriptBlock) {
            args.push("-ScriptBlock");
            args.push(ScriptBlock);
        }

        if (verbose) {
            args.push("-Verbose");
        }

        if (TargetPesterVersion !== "0.0.0") {
            args.push("-TargetPesterVersion");
            args.push(TargetPesterVersion);
        }

        logInfo(`${executable} ${args.join(" ")}`);

        var spawn = require("child_process").spawn, child;
        child = spawn(executable, args, {windowsVerbatimArguments: true});
        child.stdout.on("data", function (data) {
            logInfo(data.toString());
        });
        child.stderr.on("data", function (data) {
            logError(data.toString());
        });
        child.on("exit", function () {
            logInfo("Pester Script finished");
        });
    }
    catch (err) {
        logError(err);
    }
}

run();
