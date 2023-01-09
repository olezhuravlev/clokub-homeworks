resource "yandex_mdb_mysql_cluster" "mysql-cluster" {
  folder_id           = yandex_resourcemanager_folder.application-folder.id
  network_id          = yandex_vpc_network.vpc-network.id
  name                = "mysql-cluster"
  environment         = "PRESTABLE"
  version             = "8.0"
  security_group_ids  = [yandex_vpc_security_group.mysql-security-group.id]
  deletion_protection = true

  resources {
    resource_preset_id = "b1.medium" # RAM 4Gb
    disk_type_id       = "network-ssd"
    disk_size          = 20
  }

  access {
    web_sql   = true
    data_lens = true
  }

  maintenance_window {
    type = "ANYTIME"
  }

  backup_window_start {
    hours   = 23
    minutes = 59
  }

  mysql_config = {
    sql_mode                      = "ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION"
    max_connections               = 100
    default_authentication_plugin = "MYSQL_NATIVE_PASSWORD"
    innodb_print_all_deadlocks    = true
  }

  host {
    zone      = var.yandex-cloud-zone1
    subnet_id = yandex_vpc_subnet.vpc-subnet-private1.id
  }

  host {
    zone      = var.yandex-cloud-zone2
    subnet_id = yandex_vpc_subnet.vpc-subnet-private2.id
  }

  host {
    zone      = var.yandex-cloud-zone3
    subnet_id = yandex_vpc_subnet.vpc-subnet-private3.id
  }
}

resource "yandex_mdb_mysql_database" "netology_db" {
  cluster_id = yandex_mdb_mysql_cluster.mysql-cluster.id
  name       = "netology_db"
}

resource "yandex_mdb_mysql_user" "mysql-user" {
  cluster_id = yandex_mdb_mysql_cluster.mysql-cluster.id
  name       = "mysql"
  password   = "mysql123"

  permission {
    database_name = yandex_mdb_mysql_database.netology_db.name
    # SELECT: This privilege is for read-only, if a user gets SELECT privilege then they will only be able to view databases.
    # CREATE: This privilege is for creating tables, if a user gets CREATE privilege then they will be able to create a new table.
    # INSERT: This privilege is for inserting into the table, if the user gets INSERT privilege then they will be able to insert new records into the table.
    # DELETE: This privilege is for deleting from the table, if the user gets DELETE privilege then they will be able to delete records from the table.
    # DROP: This privilege is for dropping tables, if a user gets DROP privilege then they’ll be able to drop the table.
    # UPDATE: This privilege is for updating tables, if a user gets the UPDATE privilege then they’ll be able to update the existing records.
    # ALTER: This privilege is for altering table definition, if the user gets ALTER privilege then they will be able to alter the table definition.
    # ALL: This privilege is for all privileges, if the user gets ALL privileges then they will acquire all the above-mentioned privileges.
    roles         = ["ALL"]
  }

  connection_limits {
    max_questions_per_hour   = 10
    max_updates_per_hour     = 20
    max_connections_per_hour = 30
    max_user_connections     = 40
  }

  global_permissions = ["PROCESS"]

  authentication_plugin = "SHA256_PASSWORD"
}
