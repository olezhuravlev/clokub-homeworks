## Create Service Account to manage instance group.
#resource "yandex_iam_service_account" "instance-group-service-account" {
#  folder_id   = yandex_resourcemanager_folder.application-folder.id
#  name        = "instance-group-service-account-${terraform.workspace}"
#  description = "Service account to manage Instance Groups"
#}
#
## Assign service account role.
#resource "yandex_resourcemanager_folder_iam_member" "instance-group-service-account-storage-role" {
#  folder_id = yandex_resourcemanager_folder.application-folder.id
#  member    = "serviceAccount:${yandex_iam_service_account.instance-group-service-account.id}"
#  role      = "editor"
#}
