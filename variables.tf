## aws account reference
data "aws_caller_identity" "current" {}

## access_key
variable "aws_access_key" {}

## secret key
variable "aws_secret_key" {}

## region
variable "aws_region" {
  default = "ap-northeast-1"
}

## prefix
variable "prefix" {
  default = "elasticache"
}

## environment
variable "env" {
  default = "test"
}

## IP for remote access to ec2
variable "remote_ip" {}

## key name for ssh access
variable "key_name" {}