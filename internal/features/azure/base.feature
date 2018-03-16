@azure @azure_base
Feature: Applying an azure based environment

  Scenario: Applying a basic azure environment
    Given I setup ernest with target "https://ernest.local"
    And I setup a new environment name
    When I'm logged in as "usr" / "pwd"
    And I start recording
    And I apply the definition "azure1.yml"
    And I stop recording
    Then an event "resource_group.create.azure-fake" should be called exactly "1" times
    And all "resource_group.create.azure-fake" messages should contain a field "_provider" with "azure-fake"
    And all "resource_group.create.azure-fake" messages should contain a field "name" with "rg2"
    And all "resource_group.create.azure-fake" messages should contain a field "location" with "eastus"
    And all "resource_group.create.azure-fake" messages should contain an encrypted field "azure_client_id" with "cliid"
    And all "resource_group.create.azure-fake" messages should contain an encrypted field "azure_client_secret" with "clisec"
    And all "resource_group.create.azure-fake" messages should contain an encrypted field "azure_subscription_id" with "subid"
    And all "resource_group.create.azure-fake" messages should contain an encrypted field "azure_tenant_id" with "tenid"
    Then an event "network_interface.create.azure-fake" should be called exactly "2" times
    And all "network_interface.create.azure-fake" messages should contain a field "resource_group_name" with "rg2"
    And all "network_interface.create.azure-fake" messages should contain a field "network_security_group" with "sg2"
    And all "network_interface.create.azure-fake" messages should contain a field "enable_ip_forwarding" with "false"
    And message "network_interface.create.azure-fake" number "0" should contain "ni_test_2-1" as json field "name"
    And message "network_interface.create.azure-fake" number "0" should contain "virtual_machine::vm_test_app" as json field "virtual_machine_id"
    And message "network_interface.create.azure-fake" number "0" should contain "network_interface::ni_test_2-1" as json field "_component_id"
    And message "network_interface.create.azure-fake" number "1" should contain "virtual_machine::vm_test_app" as json field "virtual_machine_id"
    And message "network_interface.create.azure-fake" number "1" should contain "ni_test_2-2" as json field "name"
    And message "network_interface.create.azure-fake" number "1" should contain "network_interface::ni_test_2-2" as json field "_component_id"
    Then an event "virtual_machine.create.azure-fake" should be called exactly "2" times
    And all "virtual_machine.create.azure-fake" messages should contain a field "resource_group_name" with "rg2"
    And all "virtual_machine.create.azure-fake" messages should contain a field "delete_data_disks_on_termination" with "false"
    And all "virtual_machine.create.azure-fake" messages should contain a field "delete_os_disk_on_termination" with "false"
    And all "virtual_machine.create.azure-fake" messages should contain a field "location" with "eastus"
    And all "virtual_machine.create.azure-fake" messages should contain a field "vm_size" with "Standard_A0"
    And message "virtual_machine.create.azure-fake" number "0" should contain "_component_id" as json field "virtual_machine::vm_test_app-1"
    And message "virtual_machine.create.azure-fake" number "0" should contain "name" as json field "vm_test_app-1"
    And message "virtual_machine.create.azure-fake" number "1" should contain "_component_id" as json field "virtual_machine::vm_test_app-2"
    And message "virtual_machine.create.azure-fake" number "1" should contain "name" as json field "vm_test_app-2"
    And message "virtual_machine.create.azure-fake" number "0" should contain "os_profile.admin_password" as json field "Password1234!"
    And message "virtual_machine.create.azure-fake" number "0" should contain "os_profile.admin_username" as json field "testadmin"
    And message "virtual_machine.create.azure-fake" number "0" should contain "os_profile.computer_name" as json field "test"
    And message "virtual_machine.create.azure-fake" number "0" should contain "os_profile_linux_config.disable_password_authentication" as json field "false"
    And message "virtual_machine.create.azure-fake" number "0" should contain "os_profile_windows_config.enable_automatic_upgrades" as json field "false"
    And message "virtual_machine.create.azure-fake" number "0" should contain "os_profile_windows_config.provision_vm_agent" as json field "false"
    And message "virtual_machine.create.azure-fake" number "0" should contain "storage_data_disk.create_option" as json field "empty"
    And message "virtual_machine.create.azure-fake" number "0" should contain "storage_data_disk.disk_size_gb" as json field "1023"
    And message "virtual_machine.create.azure-fake" number "0" should contain "storage_data_disk.lun" as json field "0"
    And message "virtual_machine.create.azure-fake" number "0" should contain "storage_data_disk.name" as json field "myosdiskaTwo"
    And message "virtual_machine.create.azure-fake" number "0" should contain "storage_data_disk.storage_account" as json field "safest12354tom2"
    And message "virtual_machine.create.azure-fake" number "0" should contain "storage_data_disk.storage_container" as json field "scfestlatom2"
    And message "virtual_machine.create.azure-fake" number "0" should contain "storage_data_disk.vhd_uri" as json field "https://safest12354tom2.blob.core.windows.net/scfestlatom2/myosdiskaTwo-2.vhd"
    And message "virtual_machine.create.azure-fake" number "0" should contain "storage_image_reference.offer" as json field "UbuntuServer"
    And message "virtual_machine.create.azure-fake" number "0" should contain "storage_image_reference.publisher" as json field "Canonical"
    And message "virtual_machine.create.azure-fake" number "0" should contain "storage_image_reference.sku" as json field "14.04.2-LTS"
    And message "virtual_machine.create.azure-fake" number "0" should contain "storage_image_reference.version" as json field "latest"
    And message "virtual_machine.create.azure-fake" number "0" should contain "storage_os_disk.caching" as json field "ReadWrite"
    And message "virtual_machine.create.azure-fake" number "0" should contain "storage_os_disk.create_option" as json field "FromImage"
    And message "virtual_machine.create.azure-fake" number "0" should contain "storage_os_disk.name" as json field "myosdiskaOne"
    And message "virtual_machine.create.azure-fake" number "0" should contain "storage_os_disk.storage_account" as json field "safest12354tom2"
    And message "virtual_machine.create.azure-fake" number "0" should contain "storage_os_disk.storage_container" as json field "scfestlatom2"
    And message "virtual_machine.create.azure-fake" number "0" should contain "storage_os_disk.vhd_uri" as json field "https://safest12354tom2.blob.core.windows.net/scfestlatom2/myosdiskaOne-2.vhd"
    Then an event "public_ip.create.azure-fake" should be called exactly "2" times
    And all "public_ip.create.azure-fake" messages should contain a field "idle_timeout_in_minutes" with "0"
    And all "public_ip.create.azure-fake" messages should contain a field "public_ip_address_allocation" with "static"
    And all "public_ip.create.azure-fake" messages should contain a field "resource_group_name" with "rg2"
    And message "public_ip.create.azure-fake" number "0" should contain "_component_id" as json field "public_ip::ni_test_2-1-config_2"
    And message "public_ip.create.azure-fake" number "0" should contain "name" as json field "ni_test_2-1-config_2"
    And message "public_ip.create.azure-fake" number "1" should contain "_component_id" as json field "public_ip::ni_test_2-2-config_2"
    And message "public_ip.create.azure-fake" number "1" should contain "name" as json field "ni_test_2-2-config_2"
    Then an event "security_group.create.azure-fake" should be called exactly "1" times
    And all "security_group.create.azure-fake" messages should contain a field "_component_id" with "security_group::sg2"
    And all "security_group.create.azure-fake" messages should contain a field "name" with "sg2"
    And all "security_group.create.azure-fake" messages should contain a field "resource_group_name" with "rg2"
    And message "security_group.create.azure-fake" number "0" should contain "security_rules.access" as json field "Allow"
    And message "security_group.create.azure-fake" number "0" should contain "security_rules.description" as json field "awesome rule II"
    And message "security_group.create.azure-fake" number "0" should contain "security_rules.destination_address_prefix" as json field "VirtualNetwork"
    And message "security_group.create.azure-fake" number "0" should contain "security_rules.destination_port_range" as json field "100-4096"
    And message "security_group.create.azure-fake" number "0" should contain "security_rules.direction" as json field "Inbound"
    And message "security_group.create.azure-fake" number "0" should contain "security_rules.name" as json field "rule1"
    And message "security_group.create.azure-fake" number "0" should contain "security_rules.priority" as json field "101"
    And message "security_group.create.azure-fake" number "0" should contain "security_rules.protocol" as json field "Tcp"
    And message "security_group.create.azure-fake" number "0" should contain "security_rules.source_address_prefix" as json field "VirtualNetwork"
    And message "security_group.create.azure-fake" number "0" should contain "security_rules.source_port_range" as json field "100-4096"
    Then an event "storage_account.create.azure-fake" should be called exactly "1" times
    And message "storage_account.create.azure-fake" number "0" should contain "_component_id" as json field "storage_account::safest12354tom2"
    And message "storage_account.create.azure-fake" number "0" should contain "account_type" as json field "Standard_LRS"
    And message "storage_account.create.azure-fake" number "0" should contain "name" as json field "safest12354tom2"
    And message "storage_account.create.azure-fake" number "0" should contain "resource_group_name" as json field "rg2"
    Then an event "storage_container.create.azure-fake" should be called exactly "1" times
    And message "storage_container.create.azure-fake" number "0" should contain "_component_id" as json field "storage_container::scfestlatom2"
    And message "storage_container.create.azure-fake" number "0" should contain "container_access_type" as json field "private"
    And message "storage_container.create.azure-fake" number "0" should contain "name" as json field "scfestlatom2"
    And message "storage_container.create.azure-fake" number "0" should contain "resource_group_name" as json field "rg2"
    And message "storage_container.create.azure-fake" number "0" should contain "storage_account_name" as json field "safest12354tom2"
    Then an event "sql_server.create.azure-fake" should be called exactly "1" times
    And message "sql_server.create.azure-fake" number "0" should contain "_component_id" as json field "sql_server::ernestserver02tom"
    And message "sql_server.create.azure-fake" number "0" should contain "administrator_login" as json field "mradministrator"
    And message "sql_server.create.azure-fake" number "0" should contain "administrator_login_password" as json field "P4ssw0rd"
    And message "sql_server.create.azure-fake" number "0" should contain "name" as json field "ernestserver02tom"
    And message "sql_server.create.azure-fake" number "0" should contain "resource_group_name" as json field "rg2"
    And message "sql_server.create.azure-fake" number "0" should contain "version" as json field "12.0"
    Then an event "sql_database.create.azure-fake" should be called exactly "1" times
    And message "sql_database.create.azure-fake" number "0" should contain "_component_id" as json field "sql_database::mydb"
    And message "sql_database.create.azure-fake" number "0" should contain "max_size_bytes" as json field "214748364800"
    And message "sql_database.create.azure-fake" number "0" should contain "name" as json field "mydb"
    And message "sql_database.create.azure-fake" number "0" should contain "resource_group_name" as json field "rg2"
    And message "sql_database.create.azure-fake" number "0" should contain "server_name" as json field "ernestserver02tom"
