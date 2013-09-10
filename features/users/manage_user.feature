Feature: Manage Users
  In order to manage our users
  As admin
  I want to be able to create, update, and delete users

  Background:
    Given following users exist:
      | name    | email             |
      | User 1  | user1@example.com |
      | User 2  | user2@example.com |
      | User 3  | user3@example.com |
    And I sign in as admin

  @javascript
  Scenario: Listing user
    Given I am in the home page
    When I click on "Users"
    Then I should be on the users index page
    And my users list should contain
      | User 1  | user1@example.com |
      | User 2  | user2@example.com |
      | User 3  | user3@example.com |

  Scenario: Creating a user with valid information
    Given I am in the user index page
    And I click on "Add User"
    And I fill in the following:
      | Name                  | Omar Reyes         | 
      | Email                 | oreyes@itexico.com |
      | Password              | password           |
      | Password confirmation | password           |
    When I press "Create"
    Then I should see the message "User was successfully created."
    And I should be on the "users index" page
    And I should see 5 users
    And I should see an user with email oreyes@itexico.com
    
  Scenario: Trying to create a user with invalid information
    Given I am in the user index page
    And I click "Add User"
    And I fill in the following:
      | Name                  |                   | 
      | Email                 | oreyesitexico.com |
      | Password              | padsword          |
      | Password confirmation | password          |
    When I press "Create"
    Then I should see the message "You have some errors"
    And I should be on the "new user" page

  Scenario: Trying to create a user with existing email
    Given I am in the user index page
    And I click "Add User"
    And I fill in the following:
      | Name                  | Omar Retes     | 
      | Email                 | user1@example.com |
      | Password              | password          |
      | Password confirmation | password          |
    When I press "Create"
    Then I should see "You have some errors"
    And I should see the message "Email has already been taken"
    And I should be on the "new user" page


  Scenario: Updating a user with valid informartion
    Given I am in the user index page
    And I follow User 1 
    And I click on action "Edit User"
    And I fill in the following:
      | Name | User 11 | 
    When I press "Update"
    Then I should see the message "User was successfully updated." 
    
  Scenario: Updating a user with wrong information
  Scenario: Delete a user
