output "instance_id" {
  value = aws_instance.ec2.id
}

output "public_ip" {
  value = aws_instance.ec2.public_ip
}

output "key_pair_name" {
  value = aws_key_pair.generated_key.key_name
}

output "private_key_path" {
  value = local_file.private_key_pem.filename
}
