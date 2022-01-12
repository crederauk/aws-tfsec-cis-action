# aws-tfsec-cis-action

A custom GitHub action composite action that takes in directory of terraform code and runs tfsec on it, along with 4 custom checks added to tfsec, to adhere with CIS AWS Benchmark guidelines.

## Input
- `terraform-directory`: (optional) the directory to look for terraform code to scan, relative to the working directory this action is run in, leave empty to scan current directory, defaults to `terraform`

## Output
- `tfsec-result`: a multi-line string containing the scan result of tfsec, with the custom CIS Benchmark policy applied

## Example
In your GitHub action pipeline, add the following steps:
```json
- id: aws-tfsec-cis-action
  uses: crederauk/aws-tfsec-cis-action@v5
  with:
    terraform-directory: 'terraform'

- run: |
    echo <<-END
    ${{ steps.aws-tfsec-cis-action.outputs.tfsec-result }}
    END
```