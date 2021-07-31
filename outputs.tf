output "instance_eip" {
  value = module.ec2.instance_eip
}

output "primary_endpoint_address" {
  value = module.elasticahe.primary_endpoint_address
}

output "reader_endpoint_address" {
  value = module.elasticahe.reader_endpoint_address
}