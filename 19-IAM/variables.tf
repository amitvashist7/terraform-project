variable "path" {
  description = "Path in which to create the user."
  default     = "/"
}

variable "force_destroy" {
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices."
  default     = false
}
variable "username" {
  type = "list"
  default = ["test01","test02","amit01","vashist02"]
}
