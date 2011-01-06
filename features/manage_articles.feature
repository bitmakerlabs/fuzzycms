Feature: Manage Articles
  In order to to make a blog
  As an author
  I want to create and manage articles

  Scenario: Articles List
    Given I have articles titled Zombies, Witch Doctors
    When I go to the list of articles
    Then I should see "Zombies"
    And I should see "Witch Doctors"

  Scenario: Create new Article
    Given I have no articles
    When I go to the list of articles
    And I follow "New Article"
    And I fill in "Title" with "Scourge"
    And I fill in "Content" with "The bane of everyone's existance"
    And I press "Create"
    Then I should see "Scourge"
    And I should see "The bane of everyone's existance"
    And I should see "Article successfully created."

  Scenario: View a single Article
    Given I have articles titled Zombies, Scourge
    When I go to the list of articles
    And I follow "Zombies"
    Then I should see "Zombies"
    And I should see "Back to Articles"

  Scenario: Cancel creating new article
    Given I have articles titled Witches, Imps
    When I go to the list of articles
    And I follow "New Article"
    And I follow "Cancel"
    Then I should see "Blog Articles"
    And I should see "Witches"
    And I should see "Imps"
