variable "subscription_id" { 
  type = string 
} 

variable "client_id" { 
  type = string 
} 

variable "tenant_id" { 
  type = string 
} 

variable "client_secret" { 
  type = string 
} 
 
variable "region" { 
  type    = string 
  default = "westeurope" 
} 
 
variable "namespace" { 
  type    = string 
  default = "fs-advent" 
} 

variable "admin_login" {
    type = string
}

variable "admin_pass" {
    type = string
}