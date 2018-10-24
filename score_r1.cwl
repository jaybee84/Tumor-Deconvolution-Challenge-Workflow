#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [Rscript, /usr/local/bin/score.R]

hints:
  DockerRequirement:
    #dockerPull: quay.io/andrewelamb/tumor_deconvolution_challenge
    dockerPull: score_validate
    
requirements:
  - class: InlineJavascriptRequirement

inputs:

  inputfile:
    type: File
    inputBinding:
      position: 1
  
  validationFile:
    type: File
    inputBinding:
      position: 2

  jsonFile:
    type: string
    default: "results.json"
    inputBinding:
      position: 3
      
  status:
    type: string
    inputBinding:
      position: 4

outputs:

  - id: results
    type: File
    outputBinding:
      glob: $(inputs.jsonFile)
