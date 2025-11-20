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
  default     = false
}

resource "random_pet" "toggle" {
  count  = var.enable ? 1 : 0
  length = 7
}

output "created_id" {
  value = length(random_pet.toggle) > 0 ? random_pet.toggle[0].id : "resource absent"
}
