variable "RG_Dev" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
  }))
}