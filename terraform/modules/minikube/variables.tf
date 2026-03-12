variable "profile" { type = string }
variable "cpus" { type = number }
variable "memory_mb" { type = number }
variable "driver" { type = string } # docker, hyperkit, etc.
variable "addons" {
  type    = list(string)
  default = ["ingress"]
}