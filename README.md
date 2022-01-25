# tfsec-custom-action

A custom GitHub Actions composite action that takes in directory of Terraform code and runs tfsec on it, along with several custom checks added to tfsec, to adhere with CIS AWS Benchmark guidelines, and other policies.

## Input
- `terraform-directory`: (optional) the directory to look for Terraform code to scan, relative to the working directory this action is run in, leave empty to scan current directory, defaults to `terraform`
- `ignore-fail`: (optional, `true` or `false`) produce exit code 0 no matter if the tfsec check passes or not, defaults to `false`

## Output
- `tfsec-result`: a multi-line string containing the scan result of tfsec, with the custom CIS Benchmark and internal policy applied

## Example
In your GitHub Actions pipeline, add the following steps:
```yaml
- id: tfsec-custom-action
  uses: crederauk/tfsec-custom-action@v25
  with:
    terraform-directory: 'terraform'
```

## Contributing

`go test ./test [-v]` to validate custom checks against examples