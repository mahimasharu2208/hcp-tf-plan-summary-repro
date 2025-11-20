terraform {
  required_providers {
    random = { 
      source = "hashicorp/random" 
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
  length = 2
}

output "created_id" {
  value = length(random_pet.toggle) > 0 ? random_pet.toggle[0].id : "resource absent"
}
