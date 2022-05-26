terraform {
  backend "gcs" {
    bucket = "mikenabhan-terraform"
    prefix = "nabhanxyz/terraform/prodcluster"
  }
}
