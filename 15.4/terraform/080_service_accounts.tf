# Create Service Account to manage Kubernetes cluster.
resource "yandex_iam_service_account" "kuber-cluster-service-account" {
  folder_id   = yandex_resourcemanager_folder.application-folder.id
  name        = "kuber-cluster-service-account-${terraform.workspace}"
  description = "Service account to manage Kubernetes cluster"
}

# Assign service account role.
resource "yandex_resourcemanager_folder_iam_member" "kuber-cluster-service-account-roles" {
  folder_id = yandex_resourcemanager_folder.application-folder.id
  member    = "serviceAccount:${yandex_iam_service_account.kuber-cluster-service-account.id}"
  role      = "editor"
}

# Create Service Account to manage Kubernetes cluster nodes.
resource "yandex_iam_service_account" "kuber-nodes-service-account" {
  folder_id   = yandex_resourcemanager_folder.application-folder.id
  name        = "kuber-nodes-service-account-${terraform.workspace}"
  description = "Service account to manage Kubernetes cluster nodes"
}

# Assign service account role.
resource "yandex_resourcemanager_folder_iam_member" "kuber-nodes-service-account-roles" {
  folder_id = yandex_resourcemanager_folder.application-folder.id
  member    = "serviceAccount:${yandex_iam_service_account.kuber-nodes-service-account.id}"
  role      = "container-registry.images.puller"
}

#resource "yandex_resourcemanager_folder_iam_binding" "editor" {
#  # Сервисному аккаунту назначается роль "editor".
#  folder_id = "<идентификатор каталога>"
#  role      = "editor"
#  members   = [
#    "serviceAccount:${yandex_iam_service_account.<имя сервисного аккаунта>.id}"
#  ]
#}
#
#resource "yandex_resourcemanager_folder_iam_binding" "images-puller" {
#  # Сервисному аккаунту назначается роль "container-registry.images.puller".
#  folder_id = "<идентификатор каталога>"
#  role      = "container-registry.images.puller"
#  members   = [
#    "serviceAccount:${yandex_iam_service_account.<имя сервисного аккаунта>.id}"
#  ]
#}