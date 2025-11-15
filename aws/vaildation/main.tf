variable "fruit" {
  type        = string
  description = "What fruit to pick?"
  default     = "apple"
  validation {
    condition     = can(regex("^(lemon|apple|mango|banana|cherry)$", var.fruit))
    error_message = "Invalid fruit selected, only allowed fruits are: 'lemon', 'apple', 'mango', 'banana', 'cherry'."
  }
}


variable "resource_count" {
  type = number
  validation {
    condition     = var.resource_count > 0 && var.resource_count < 5
    error_message = "Resource count should be between 0 and 5"
  }
}


variable "resource_count" {
  type = number
  validation {
    condition     = var.resource_count > 0 && var.resource_count < 5
    error_message = "Resource count should be between 0 and 5"
  }
}
