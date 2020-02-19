variable "key_name" {
  default = "terrafrom_key_pair"
}

variable "pvt_key" {
  default = "/root/.ssh/terrafrom_key_pair.pem"
}

variable "us-east-zones" {
  default = ["us-east-2a", "us-east-2b"]
}

variable "sg-id" {
  default = "sg-025a9dc0ed03bc43a"
}
