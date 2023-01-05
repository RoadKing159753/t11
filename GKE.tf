resource "google_container_cluster" "example" {
  name               = var.name
  location           = var.location
  project            = data.google_project.project.name
  enable_binary_authorization = false
  enable_intranode_visibility = false
  enable_shielded_nodes = false
  node_config {
    shielded_instance_config {
      enable_integrity_monitoring = false
    }
     workload_metadata_config {
      node_metadata = "METADATA_SERVER_NAME"
    }
  }
  private_cluster_config {
       enable_private_nodes    = false
       enable_private_endpoint = false
       master_ipv4_cidr_block  = false
    }
}
