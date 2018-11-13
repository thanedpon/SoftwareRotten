Feature: User can manually add movie

Scenario: Add a movie
  Given I am on the RottenPotatoes home page
  When I follow "add"
  Then I should be on the Create New Movie page
  When I fill in "Title" with "Star Wars"
  And I select "PG" from "Rating"
  And I press "Save Changes"
  And I follow "Cancel"
  Then I should be on the RottenPotatoes home page
  And I should see "Star Wars"