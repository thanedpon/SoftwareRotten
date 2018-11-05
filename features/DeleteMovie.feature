Feature: User can delete movie

Scenario: Delete Movie
  When There are some movies in database 
  Given I am on the RottenPotatoes home page
  And I should see "Conjuring"
  And I should see "Home Stay"
  When I follow "More about Conjuring"
  And I follow "Delete"
  Then I should be on the RottenPotatoes home page
  And I should see "'Conjuring' delete"
  And I should see "Home Stay"