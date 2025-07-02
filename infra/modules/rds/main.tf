resource "aws_db_instance" "default" {
  allocated_storage    = 20
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  name                 = var.db_name
  username             = var.username
  password             = var.password
  skip_final_snapshot  = true
}

output "db_endpoint" {
  value = aws_db_instance.default.endpoint
}
