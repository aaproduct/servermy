@cli @skipOnLDAP
Feature: add a user using the using the occ command

  As an administrator
  I want to be able to add users via the command line
  So that I can give people controlled individual access to resources on the ownCloud server and
  So that I can write scripts to add users

  Scenario: admin creates an ordinary user using the occ command
    When the administrator creates this user using the occ command:
      | username  |
      | justauser |
    Then the command should have been successful
    And the command output should contain the text 'The user "justauser" was created successfully'
    And user "justauser" should exist
    And user "justauser" should be able to access a skeleton file

  Scenario: admin creates an ordinary user sspecifying attributes using the occ command
    When the administrator creates this user using the occ command:
      | username  | displayname | email                 |
      | justauser | Just A User | justauser@example.com |
    Then the command should have been successful
    And the command output should contain the text 'The user "justauser" was created successfully'
    And the command output should contain the text 'Display name set to "Just A User"'
    And the command output should contain the text 'Email address set to "justauser@example.com"'
    And user "justauser" should exist
    And user "justauser" should be able to access a skeleton file
    When the administrator retrieves the information of user "justauser" using the provisioning API
    Then the user attributes returned by the API should include
      | displayname      | Just A User           |
      | email            | justauser@example.com |
