**Ticket Type:** Task  
**Title:** Terraform Files and Templates with AWS  
**Project:** Cloud Infrastructure Deployment  
**Assignee:** You  
**Reporter:** Derek Morgan  
**Priority:** High  
**Labels:** Terraform, AWS, S3, Templates, Files  
**Epic Link:** AWS Infrastructure Expansion  
**Sprint:** Sprint 01/Files and Templates

**Lab Setup**
This lab uses Localstack to simulate an AWS environment. Localstack is already preinstalled in your environment. You don't need keys or to configure the provider. If you'd like to use your own account, feel free to specify your provider configuration and run `unset aws` and `unset terraform` to decouple them from Localstack.

**Description:**

The team needs to create an S3 bucket for infrastructure documentation and configuration files. They want to use standardized `README.md` and `.gitignore` files for their Terraform projects. The team is happy with the current `.gitignore` provided by GitHub: <a href="https://github.com/github/gitignore/blob/main/Terraform.gitignore" target="_blank">https://github.com/github/gitignore/blob/main/Terraform.gitignore</a>, but they need to remove any reference to `tfvars` files. Use that template, remove the `tfvars` references, and upload it as an S3 object. For the `README.md` file, you'll need to provide some infrastructure information based on the acceptance criteria below.

```
resource "aws_s3_bucket" "infra_docs" {
  bucket = "infra-docs-${var.env}"
}

resource "aws_s3_object" "gitignore" {
  bucket  = aws_s3_bucket.infra_docs.id
  key     = ".gitignore"
  content = <use functions to provide content from templates>
}

resource "aws_s3_object" "readme" {
  bucket  = aws_s3_bucket.infra_docs.id
  key     = "README.md"
  content = "Add README content here"
}
```

**Acceptance Criteria:**

> **Note:** If the `terraform validate` command fails, all tasks in the lab will fail!

1. Create a `templates` directory for the new templates.  
2. Create the `.gitignore.tpl` file in the `templates` directory from an existing Terraform Gitignore file and remove the references to `tfvars`.   
3. Create the `README.md.tpl` file in the `templates` directory with the following information formatted how you wish:  
	1\. Project name  
	2\. Environment (dev/prod)  
	3\. S3 bucket URL  
4. Ensure you use the most efficient function for each file. Hint: if there are no `vars`, you may want to use a different function than if there are.   
5. For the most efficient deployment and ability to add more files in the future, use `for_each` and a `locals` block to create the S3 objects. 

**Implementation Notes:**

**Hint** If you're using your own AWS account, be sure your bucket name is globally unique. 

- <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket" target="_blank">AWS S3 Bucket Documentation</a>  
- <a href="https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object" target="_blank">AWS S3 Object Documentation</a>  
- <a href="https://developer.hashicorp.com/terraform/language/values/locals" target="_blank">Terraform Locals Documentation</a>  
- <a href="https://developer.hashicorp.com/terraform/language/meta-arguments/for_each" target="_blank">Terraform For Each Documentation</a>  
- <a href="https://github.com/github/gitignore/blob/main/Terraform.gitignore" target="_blank">Terraform Gitignore Template</a>  
- <a href="https://developer.hashicorp.com/terraform/language/functions/templatefile" target="_blank">Terraform Templatefile Function</a>  
- <a href="https://developer.hashicorp.com/terraform/language/functions/file" target="_blank">Terraform File Function</a>
