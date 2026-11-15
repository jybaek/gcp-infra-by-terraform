output "vm_name" {
  value = google_compute_instance.private_vm.name
}

output "vm_service_account_email" {
  value = google_service_account.vm_sa.email
}
