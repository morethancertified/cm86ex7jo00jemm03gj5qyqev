**Ticket Type:** Task  
**Title:** Terraform Locals  
**Project:** Version Control System Deployment  
**Assignee:** You  
**Reporter:** Derek Morgan  
**Priority:** High  
**Labels:** Terraform, GitHub, Locals  
**Epic Link:** GitHub Expansion  
**Sprint:** Sprint 01/Files and Templates

**Description:**

The team needs to create Terraform repositories and use standardized `README.md` and `.gitignore` files for the Terraform repositories created. The team is happy with the current `.gitignore` provided by GitHub: <a href="https://github.com/github/gitignore/blob/main/Terraform.gitignore" target="_blank">https://github.com/github/gitignore/blob/main/Terraform.gitignore</a>, but they need to remove any reference to `tfvars` files. Use that template, remove the `tfvars` references, and provide it as a `github_repository_file` to an infrastructure repository. For the `README.md` file, you’ll need to provide some repository information based on the acceptance criteria below. 

```
resource "github_repository" "infra-dev" {
  name               = "infra-dev"
  description        = "Infrastructure Dev Repository"
  auto_init          =  true
  visibility         = "private"
  gitignore_template = "Terraform"
}

resource "github_repository_file" "this" {
 repository          = github_repository.this.name
 branch              = "main"
 file                = ".gitignore"
 content             = <use functions to provide content from templates>
 commit_message      = "Managed by Terraform"
 overwrite_on_create = true
}

```

**Acceptance Criteria:**

> **Note:** If the `terraform validate` command fails, all tasks in the lab will fail!

1\. Create a `templates` directory for the new templates.  
2\. Create the `.gitignore.tpl` file in the `templates` directory from an existing Terraform Gitignore file and remove the references to `tfvars`.   
3\. Create the `README.md.tpl` file in the `templates` directory with the following information formatted how you wish:  
	1\. Repository name  
	2\. Repository description  
	3\. Html URL for the repository  
4\. Ensure you use the most efficient function for each file. Hint: if there are no `vars`, you may want to use a different function than if there are.   
5\. For the most efficient deployment and ability to add more files in the future, use `for_each` and a `locals` block to create the files. 

**Implementation Notes:**

Feel free to use code from previous labs. 

- <a href="https://registry.terraform.io/providers/integrations/github/latest/docs" target="_blank">GitHub Provider Documentation</a>  
- <a href="https://developer.hashicorp.com/terraform/language/values/locals" target="_blank">Terraform Documentation</a>  
- <a href="https://developer.hashicorp.com/terraform/language/meta-arguments/for_each" target="_blank">Terraform Documentation</a>  
- <a href="https://github.com/github/gitignore/blob/main/Terraform.gitignore" target="_blank">https://github.com/github/gitignore/blob/main/Terraform.gitignore</a>  
- <a href="https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository_file" target="_blank">GitHub Provider Documentation</a>  
- <a href="https://developer.hashicorp.com/terraform/language/functions/templatefile" target="_blank">Terraform Documentation</a>  
- <a href="https://developer.hashicorp.com/terraform/language/functions/file" target="_blank">Terraform Documentation</a>
