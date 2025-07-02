resource "aws_secretsmanager_secret" "example" {
  name = var.secret_name
}

resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = aws_secretsmanager_secret.example.id
  secret_string = jsonencode(var.secret_data)
}

output "secret_arn" {
  value = aws_secretsmanager_secret.example.arn
}
