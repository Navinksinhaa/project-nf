resource "aws_ecr_repository" "repos" {
  for_each = toset(var.repos)
  name     = each.value
}

output "repository_urls" {
  value = { for repo in aws_ecr_repository.repos : repo.name => repo.repository_url }
}
