@vcloud @vcloud_base
Feature: Environment apply

  Scenario: Applying a basic environment
    Given I setup ernest with target "https://ernest.local"
    And I setup a new environment name
    When I'm logged in as "usr" / "secret123"
    And I start recording
    And I apply the definition "vcloud1.yml"
    And I stop recording
    Then an event "router.create.vcloud-fake" should be called exactly "1" times
    And all "router.create.vcloud-fake" messages should contain a field "_provider" with "vcloud-fake"
    And all "router.create.vcloud-fake" messages should contain a field "name" with "vse2"
    And all "router.create.vcloud-fake" messages should contain a field "datacenter_name" with "fakevcloud"
    And all "router.create.vcloud-fake" messages should contain an encrypted field "vcloud_url" with "https://vcloud.net"
    And all "router.create.vcloud-fake" messages should contain an encrypted field "datacenter_username" with "fakeuser@test"
    And all "router.create.vcloud-fake" messages should contain an encrypted field "datacenter_password" with "test123"
    And message "router.create.vcloud-fake" number "0" should contain "in_in_any" as json field "firewall_rules.0.name"
    And message "router.create.vcloud-fake" number "0" should contain "internal" as json field "firewall_rules.0.source_ip"
    And message "router.create.vcloud-fake" number "0" should contain "any" as json field "firewall_rules.0.source_port"
    And message "router.create.vcloud-fake" number "0" should contain "internal" as json field "firewall_rules.0.destination_ip"
    And message "router.create.vcloud-fake" number "0" should contain "any" as json field "firewall_rules.0.destination_port"
    And message "router.create.vcloud-fake" number "0" should contain "any" as json field "firewall_rules.0.protocol"
    And message "router.create.vcloud-fake" number "0" should contain "office2_in_22" as json field "firewall_rules.1.name"
    And message "router.create.vcloud-fake" number "0" should contain "172.18.143.3" as json field "firewall_rules.1.source_ip"
    And message "router.create.vcloud-fake" number "0" should contain "any" as json field "firewall_rules.1.source_port"
    And message "router.create.vcloud-fake" number "0" should contain "internal" as json field "firewall_rules.1.destination_ip"
    And message "router.create.vcloud-fake" number "0" should contain "22" as json field "firewall_rules.1.destination_port"
    And message "router.create.vcloud-fake" number "0" should contain "tcp" as json field "firewall_rules.1.protocol"
    And message "router.create.vcloud-fake" number "0" should contain "office1_in_22" as json field "firewall_rules.2.name"
    And message "router.create.vcloud-fake" number "0" should contain "172.17.240.0/24" as json field "firewall_rules.2.source_ip"
    And message "router.create.vcloud-fake" number "0" should contain "any" as json field "firewall_rules.2.source_port"
    And message "router.create.vcloud-fake" number "0" should contain "internal" as json field "firewall_rules.2.destination_ip"
    And message "router.create.vcloud-fake" number "0" should contain "22" as json field "firewall_rules.2.destination_port"
    And message "router.create.vcloud-fake" number "0" should contain "tcp" as json field "firewall_rules.2.protocol"
    And message "router.create.vcloud-fake" number "0" should contain "home_in_22" as json field "firewall_rules.3.name"
    And message "router.create.vcloud-fake" number "0" should contain "172.19.186.30" as json field "firewall_rules.3.source_ip"
    And message "router.create.vcloud-fake" number "0" should contain "any" as json field "firewall_rules.3.source_port"
    And message "router.create.vcloud-fake" number "0" should contain "internal" as json field "firewall_rules.3.destination_ip"
    And message "router.create.vcloud-fake" number "0" should contain "22" as json field "firewall_rules.3.destination_port"
    And message "router.create.vcloud-fake" number "0" should contain "tcp" as json field "firewall_rules.3.protocol"
    And message "router.create.vcloud-fake" number "0" should contain "dnat" as json field "nat_rules.0.type"
    And message "router.create.vcloud-fake" number "0" should contain "172.16.186.44" as json field "nat_rules.0.origin_ip"
    And message "router.create.vcloud-fake" number "0" should contain "22" as json field "nat_rules.0.origin_port"
    And message "router.create.vcloud-fake" number "0" should contain "10.1.0.11" as json field "nat_rules.0.translation_ip"
    And message "router.create.vcloud-fake" number "0" should contain "22" as json field "nat_rules.0.translation_port"
    And message "router.create.vcloud-fake" number "0" should contain "tcp" as json field "nat_rules.0.protocol"
    Then an event "network.create.vcloud-fake" should be called exactly "1" times
    And all "network.create.vcloud-fake" messages should contain a field "_provider" with "vcloud-fake"
    And all "network.create.vcloud-fake" messages should contain a field "range" with "10.1.0.0/24"
    And all "network.create.vcloud-fake" messages should contain an encrypted field "vcloud_url" with "https://vcloud.net"
    And all "network.create.vcloud-fake" messages should contain a field "datacenter_name" with "fakevcloud"
    And all "network.create.vcloud-fake" messages should contain an encrypted field "datacenter_username" with "fakeuser@test"
    And all "network.create.vcloud-fake" messages should contain an encrypted field "datacenter_password" with "test123"
    Then an event "instance.create.vcloud-fake" should be called exactly "1" times
    And all "instance.create.vcloud-fake" messages should contain a field "_provider" with "vcloud-fake"
    And all "instance.create.vcloud-fake" messages should contain an encrypted field "vcloud_url" with "https://vcloud.net"
    And all "instance.create.vcloud-fake" messages should contain a field "datacenter_name" with "fakevcloud"
    And all "instance.create.vcloud-fake" messages should contain an encrypted field "datacenter_username" with "fakeuser@test"
    And all "instance.create.vcloud-fake" messages should contain an encrypted field "datacenter_password" with "test123"
    And all "instance.create.vcloud-fake" messages should contain a field "name" with "web-1"
    And all "instance.create.vcloud-fake" messages should contain a field "hostname" with "web-1"
    And all "instance.create.vcloud-fake" messages should contain a field "ip" with "10.1.0.11"
    And all "instance.create.vcloud-fake" messages should contain a field "network" with "web"
    And all "instance.create.vcloud-fake" messages should contain a field "cpus" with "1"
    And all "instance.create.vcloud-fake" messages should contain a field "ram" with "1024"
    And all "instance.create.vcloud-fake" messages should contain a field "reference_image" with "ubuntu-1404"
    And all "instance.create.vcloud-fake" messages should contain a field "reference_catalog" with "r3"
    And all "instance.create.vcloud-fake" messages should contain a field "_state" with "running"
