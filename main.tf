terraform {
  required_providers {
    random = { 
      source = "hashicorp/random" 
    }
  }

  cloud { 
    organization = "mahima-test" 
    workspaces { 
      name = "github-actions-test" 
    } 
  } 
}

variable "enable" {
  description = "Toggle resource on/off. Set to true to create, false to destroy."
  type        = bool
  default     = true
}

resource "random_pet" "toggle" {
  count  = var.enable ? 1 : 0
  length = 7
}

resource "random_pet" "toggle1" {
  count  = var.enable ? 1 : 0
  length = 10
}

output "created_id" {
  value = length(random_pet.toggle) > 0 ? random_pet.toggle[0].id : "resource absent"
}

output "created_id_1" {
  value = length(random_pet.toggle1) > 0 ? random_pet.toggle1[0].id : "resource absent"
}
