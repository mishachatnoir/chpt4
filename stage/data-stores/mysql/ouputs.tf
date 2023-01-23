output "address" {
  value = aws_db_instance.example.address
  description = "The port the database is listening on"
}

output "port" {
  value = aws_db_instance.example.port
  description = "The port the database is listening on"
}