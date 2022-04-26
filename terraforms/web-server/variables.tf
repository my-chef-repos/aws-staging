variable "ssh_key_file" {
  type        = string
  default     = "/home/ec2-user/aws-r-goto_osaka_ed25519.pem"
}

variable "user_name" {
  type = string
  default = "ec2-user"
}

# The below is for variables' initialization. 
# Values are all null. Specify them in respective .tfvars files. 

variable "instance_count" {
  type        = number
  default     = 0
}

variable "policy_group" {
  type        = string
  default     = ""
}

variable "policy_name" {
  type        = string
  default     = ""
}