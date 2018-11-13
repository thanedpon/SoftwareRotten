Feature: Check Home Page

Scenario: Welcome to Rottenpotatoes
    When I go to the Welcome Page
    Then I should see "Login with facebook"
    And I should see "Login with twitter"
    
    