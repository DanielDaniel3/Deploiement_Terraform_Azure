# Déclare les paramètres personnalisables comme le nom du cluster ou la région.

variable "resource_group_location" {
  type        = string
  default     = "eastus"
  description = "Location du resource group."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Préfix du resource group name combiné avec un random."
}

variable "node_count" {
  type        = number
  description = "Quantité initial des noeuds pour le node pool."
  default     = 3
}

variable "msi_id" {
  type        = string
  description = "Le Service Identity ID managé"
  default     = null
}

variable "username" {
  type        = string
  description = "Le username admin pour le nouveau cluster."
  default     = "azureadmin"
}