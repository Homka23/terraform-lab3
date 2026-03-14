variable "vpc_cidr" {
  description = "CIDR для VPC"
  default     = "10.10.0.0/16"
}

variable "subnet_a_cidr" {
  description = "CIDR для підмережі A"
  default     = "10.10.10.0/24"
}

variable "subnet_b_cidr" {
  description = "CIDR для підмережі B"
  default     = "10.10.20.0/24"
}

variable "web_port" {
  description = "Порт для веб-сервера"
  default     = 8008
}

variable "apache_server_name" {
  description = "ServerName для Apache"
  default     = "var10.local"
}

variable "apache_docroot" {
  description = "DocumentRoot для Apache"
  default     = "/var/www/site_10"
}