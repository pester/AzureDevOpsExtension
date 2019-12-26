A task to install and run PowerShell Pester based tests
The task takes five parameters

The main ones are

- Folder to run scripts from e.g $(Build.SourcesDirectory)\\* or a script hashtable @{Path='$(Build.SourcesDirectory)'; Parameters=@{param1='111'; param2='222'}}"
- The results file name, defaults to $(Build.SourcesDirectory)\Test-Pester.XML.
- The code coverage file name, this outputs a JaCoCo XML file that the code coverage task can read. *Note: Requires Pester 4.0.4+*
- Tagged test cases to run.
- Tagged test cases to exclude from test run.

The advanced ones are

- Should the instance of PowerShell used to run the test be forced to run in 32bit, defaults to false.

The Pester task does not in itself upload the test results, it just throws an error if tests fails. It relies on the standard test results upload task.

So you also need to add the test results upload and set the following parameters

- Set it to look for nUnit format files
- It already defaults to the correct file name pattern.

IMPORTANT: As the Pester task will stop the build on an error you need to set the ‘Always run’ to make sure the results are published.

Once all this is added to your build you can see your Pester test results in the build summary

Releases

- 1.0.x - Initial public release of cross platform extension
