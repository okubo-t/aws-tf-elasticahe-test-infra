variable "vpc_id" {
  type = string
}

variable "ec2_name" {
  type    = string
  default = "test-ec2"
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "c5.large"
}

variable "key_name" {
  type = string
}

variable "user_data" {
  type    = string
  default = "./modules/ec2/user_data.sh"
}

variable "subnet_id" {
  type = string
}

variable "volume_type" {
  type    = string
  default = "gp2"
}

variable "volume_size" {
  type    = number
  default = 100
}

variable "delete_on_termination" {
  type    = bool
  default = true
}

variable "ec2_trust_policy" {
  type    = string
  default = "./modules/ec2/ec2_trust_policy.json"
}

variable "remote_ip" {
  type    = string
  default = "192.168.0.1/32"
}