# Create service account for Storage Bucket access.
resource "yandex_iam_service_account" "storage-service-account" {
  folder_id   = yandex_resourcemanager_folder.application-folder.id
  name        = "storage-service-account-${terraform.workspace}"
  description = "Service account to be used by Bucket Object Storage"
}

# Assign service account role.
resource "yandex_resourcemanager_folder_iam_member" "storage-service-account-role" {
  folder_id = yandex_resourcemanager_folder.application-folder.id
  member    = "serviceAccount:${yandex_iam_service_account.storage-service-account.id}"
  role      = "storage.admin"
}

# Create Static Access Key.
resource "yandex_iam_service_account_static_access_key" "storage-service-account-static-key" {
  service_account_id = yandex_iam_service_account.storage-service-account.id
  description        = "Static access key for Bucket Object Storage"
}

# Create Service Account to manage instance group.
resource "yandex_iam_service_account" "instance-group-service-account" {
  folder_id   = yandex_resourcemanager_folder.application-folder.id
  name        = "instance-group-service-account-${terraform.workspace}"
  description = "Service account to manage Instance Groups"
}

# Assign service account role.
resource "yandex_resourcemanager_folder_iam_member" "instance-group-service-account-storage-role" {
  folder_id = yandex_resourcemanager_folder.application-folder.id
  member    = "serviceAccount:${yandex_iam_service_account.instance-group-service-account.id}"
  role      = "editor"
}
