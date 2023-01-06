## Allowance to work with encription/decryption.
#resource "yandex_resourcemanager_folder_iam_member" "admin" {
#  folder_id = yandex_resourcemanager_folder.application-folder.id
#  role      = "kms.keys.encrypterDecrypter"
#  member    = "serviceAccount:${yandex_iam_service_account.storage-service-account.id}"
#}
