terraform {
  required_version = ">= 1.1.0"
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = ">= 3.15.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "2.1.0"
    }
  }
}