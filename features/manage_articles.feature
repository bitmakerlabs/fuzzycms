Feature: Manage Articles
  In order to to make a blog
  As an author
  I want to create and manage articles

  Background: login
    Given I have a user called "Frodo Baggins" with a password of "password"
    When I go to the home page
    And I follow "Login"
    And I fill in "frodo@example.com" for "Email"
    And I fill in "password" for "Password"
    And I press "Login"

  Scenario: Articles List
    Given I have articles titled "Zombies, Witch Doctors" written by "frodo@example.com"
    When I go to the list of articles
    Then I should see "Zombies"
    And I should see "Witch Doctors"
    And I should see "Frodo Baggins"

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
    And I should see "Frodo Baggins"

  Scenario: View a single Article
    Given I have articles titled "Zombies, Scourge" written by "frodo@example.com"
    When I go to the list of articles
    And I follow "Zombies"
    Then I should see "Zombies"
    And I should see "Back to Articles"
    And I should see "Frodo Baggins"

  Scenario: Cancel creating new article
    Given I have articles titled "Witches, Imps" written by "frodo@example.com"
    When I go to the list of articles
    And I follow "New Article"
    And I follow "Cancel"
    Then I should see "Blog Articles"
    And I should see "Witches"
    And I should see "Imps"
    And I should see "Frodo Baggins"
