Feature: User can Edit movie

Scenario: Edit Movie
  When There are some movies in database 
  Given I am on the RottenPotatoes home page
  And I should see "Conjuring"
  When I follow "More about Conjuring"
  When I follow "Edit info"
  When I should be on the Edit Movie page
  And I fill in "Title" with "Conjuring2nd"
  And I select "PG" from "Rating"
  And I press "Save changes"
  Then I should be on the Conjuring Detail page
  And I should see "Conjuring2nd"