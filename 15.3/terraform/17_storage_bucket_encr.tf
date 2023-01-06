## Create Storage Bucket.
#resource "yandex_storage_bucket" "storage-bucket-encrypted" {
#  bucket     = "${var.bucket_id}-encrypted"
#  access_key = yandex_iam_service_account_static_access_key.storage-service-account-static-key.access_key
#  secret_key = yandex_iam_service_account_static_access_key.storage-service-account-static-key.secret_key
#
#  anonymous_access_flags {
#    read = true
#    list = false
#  }
#
#    website {
#      index_document = "index.html"
#    }
#
#  server_side_encryption_configuration {
#    rule {
#      apply_server_side_encryption_by_default {
#        kms_master_key_id = yandex_kms_symmetric_key.key-a.id
#        sse_algorithm     = "aws:kms"
#      }
#    }
#  }
#}
