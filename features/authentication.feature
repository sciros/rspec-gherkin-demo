Feature: basic authentication
  Scenario: log in with valid credentials
    Given I am not logged in
     Then I can log in with valid credentials