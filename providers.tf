provider "proxmox" {
  pm_api_url      = var.xyzproxmoxapiurl
  pm_user         = var.xyzproxmoxuser
  pm_password     = var.xyzpmpass
  pm_tls_insecure = true
}


provider "cloudflare" {
  api_token = var.xyzcloudflare_token
}

provider "http" {

}

