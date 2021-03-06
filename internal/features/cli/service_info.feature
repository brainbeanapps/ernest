@environment @environment_info
Feature: Ernest environment info

  Scenario: Non logged user info
    Given I setup ernest with target "https://ernest.local"
    And I logout
    When I run ernest with "environment info"
    Then The output should contain "Please provide required parameters"
    Then The output should contain "$ ernest env definition <my_project> <my_env>"
    When I run ernest with "environment info project environment"
    Then The output should contain "You're not allowed to perform this action, please log in"

  Scenario: Logged user info
    Given I setup ernest with target "https://ernest.local"
    And I'm logged in as "usr" / "secret123"
    And The environment "fakeaws/destroyable" does not exist
    And I apply the definition "destroyable.yml"
    When I run ernest with "environment info fakeaws destroyable"
    Then The output should contain "Name : destroyable"
    And The output should contain "VPCs:"
    And The output should contain "| test-vpc | fakeaws |"
    And The output should contain "Networks:"
    And The output should contain "| web  | foo |"
