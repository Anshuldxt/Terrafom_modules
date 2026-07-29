variable "nic_dev" {
  type = object({
    name                = string
    resource_group_name = string
    subnet_id           = string
  })
}