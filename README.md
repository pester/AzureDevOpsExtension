# Pester Test Runner

This is the repository for the Pester Test Runner Azure Pipelines extension.

To make use of this extension you need to install it from the Azure DevOps Marketplace: https://marketplace.visualstudio.com/items?itemName=Pester.PesterRunner

From here you can make use of the task in your pipelines to run Pester tests. The task currently has the following inputs:

* Scripts Folder or Script - Location of test files to run. Also supports the hashtable syntax that allows specifying parameters for tests, as seen in [this example](https://pester.dev/docs/commands/Invoke-Pester#example-3).
* Results File - Path and name for the resulting xml file to be written to. This can then be used with the Publish Test Results task to publish results back to the pipeline.
* Code Coverage Output File - Path and name for the resulting xml file to be written to. This can then be used with the Publish Code Coverage task to publish coverage back to the pipeline. Coverage file is in JaCoCo format. *Note*: Specifying this requires setting the Code Coverage Folder path to point to the source files your tests are being run against.
* Tags - Any tags of tests you want to run. Accepts a comma separated list.
* Exclude Tag - Any tags to exclude running. Accepts a comma separate list.
* Use PowerShell Core (Windows Only) - If you should use PSCore on Windows. By default will use PSCore on non-Windows and Windows PowerShell on Windows.
* Path to additional PowerShell modules - Any additional module paths that should be prepended to the PSModulePath before running Pester.
* Code Coverage Folder - Folder containing source files for calculating code coverage against. All ps1 and psm1 files will be picked up by this, tests.ps1 will be excluded.
* Run in 32bit - If the task should run in a 32 bit process. Only available on Windows PowerShell.
* Pester Version - If the task should run latest available pester or you want to specify a version.
* Preferred Pester PowerShell Version - Which version of Pester should be downloaded at run time to use for running tests.
* Pre-Test ScriptBlock - A Scriptblock that will be run before Pester, useful for any major scaffolding that needs to be done before tests are run.

In YAML pipelines this looks like:

```yaml
- task: Pester@9
  inputs:
    # Required Arguments
    scriptFolder: '$(System.DefaultWorkingDirectory)\tests'
    resultsFile: '$(System.DefaultWorkingDirectory)\Test-Pester.XML'

    #Optional Arguments
    CodeCoverageOutputFile: '$(System.DefaultWorkingDirectory)\CC-Pester.XML'
    tag: a,b,c
    excludeTag: d,e,f
    usePSCore: False
    additionalModulePath: 'c:\test\modules'
    CodeCoverageFolder: '$(System.DefaultWorkingDirectory)\src'
    run32Bit: False
    PesterVersion: 'LatestVersion|OtherVersion'
    preferredPesterVersion: '4.10.1'
    ScriptBlock: '{Setup-ImportantThings}'
```
