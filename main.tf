terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
    }
  }
}

# ---------------------------------------------------
# 1. Random Pet – always recreated on changes
# ---------------------------------------------------
resource "random_pet" "pet_name" {
  length = 2
}

# ---------------------------------------------------
# 2. Random Integer – detectable changes on re-runs
# ---------------------------------------------------
resource "random_integer" "number" {
  min = 10
  max = 99
}

# ---------------------------------------------------
# 3. Random String – includes special characters
# ---------------------------------------------------
resource "random_string" "token" {
  length  = 8
  special = true
}

# ---------------------------------------------------
# 4. Random Shuffle – stable unless inputs change
# ---------------------------------------------------
resource "random_shuffle" "colors" {
  input = ["red", "green", "blue", "yellow"]
}

# ---------------------------------------------------
# Outputs – so you can see the values in apply
# ---------------------------------------------------
output "pet_name" {
  value = random_pet.pet_name.id
}

output "number" {
  value = random_integer.number.result
}

output "token" {
  value = random_string.token.result
}

output "colors" {
  value = random_shuffle.colors.result
}

