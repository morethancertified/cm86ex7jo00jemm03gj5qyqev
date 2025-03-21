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
 content             = # <use functions to provide content from templates>
 commit_message      = "Managed by Terraform"
 overwrite_on_create = true
}