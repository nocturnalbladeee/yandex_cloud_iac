variable "folder_id" {
  type        = string
  description = "ID каталога"
}

variable "service_accounts" {
  description = "Карта сервисных аккаунтов"
  type = map(object({
    name        = string
    description = string
    roles       = list(string)
  }))
  default = {} 
}

variable "name" {
  type    = string
  default = null
}

variable "description" {
  type    = string
  default = null
}

variable "role" {
  type    = string
  default = null
}
