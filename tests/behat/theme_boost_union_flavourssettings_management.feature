@theme @theme_boost_union @theme_boost_union_flavourssettings @theme_boost_union_flavourssettings_management
Feature: Configuring the theme_boost_union plugin on the "Flavours" page, managing the individual flavours
  In order to use the features
  As admin
  I need to be able to configure the theme Boost Union plugin

  Scenario: Flavours: Management - When the theme is installed, no flavours exist
    When I log in as "admin"
    And I navigate to "Appearance > Themes > Boost Union > Flavours" in site administration
    Then I should see "Flavours" in the "#region-main h2" "css_element"
    And I should see "There aren't any flavours created yet. Please create your first flavour to get things going."
    And "table" "css_element" should not exist in the "#region-main" "css_element"
    And "Create flavour" "button" should exist in the "#region-main" "css_element"
    And "Preview" "button" should not exist in the "#region-main" "css_element"
    And "Edit" "button" should not exist in the "#region-main" "css_element"
    And "Delete" "button" should not exist in the "#region-main" "css_element"

  Scenario: Flavours: Management - Add a flavour (and set its metadata)
    When I log in as "admin"
    And I navigate to "Appearance > Themes > Boost Union > Flavours" in site administration
    And I click on "Create flavour" "button"
    And I should see "Create flavour" in the "#page-header h1" "css_element"
    And I set the field "Title" to "My shiny new flavour"
    And I set the field "Description" to "<p>This is a great flavour</p>"
    And I click on "Save changes" "button"
    Then I should see "Flavours" in the "#region-main h2" "css_element"
    And I should not see "There aren't any flavours created yet. Please create your first flavour to get things going."
    And "table" "css_element" should exist in the "#region-main" "css_element"
    And "Create flavour" "button" should exist in the "#region-main" "css_element"
    And "Preview" "button" should exist in the "#region-main table" "css_element"
    And "Edit" "button" should exist in the "#region-main table" "css_element"
    And "Delete" "button" should exist in the "#region-main table" "css_element"
    And I should see "My shiny new flavour" in the "#region-main table" "css_element"
    And I should see "This is a great flavour" in the "#region-main table" "css_element"

  Scenario: Flavours: Management - Preview existing flavours
    When I log in as "admin"
    And I navigate to "Appearance > Themes > Boost Union > Flavours" in site administration
    And I click on "Create flavour" "button"
    And I should see "Create flavour" in the "#page-header h1" "css_element"
    And I set the field "Title" to "My shiny new flavour"
    And I click on "Save changes" "button"
    And I should see "Flavours" in the "#region-main h2" "css_element"
    And I click on "Preview" "button" in the "#region-main table" "css_element"
    Then I should see "Preview flavour" in the "#page-header h1" "css_element"
    And I should see "Lorem ipsum dolor sit amet" in the "#region-main" "css_element"
    And "Back to flavour overview" "button" should exist in the "#region-main" "css_element"
    And I click on "Back to flavour overview" "button" in the "#region-main" "css_element"
    And I should see "Flavours" in the "#region-main h2" "css_element"

  Scenario: Flavours: Management - Edit (the metadata of) an existing flavour
    When I log in as "admin"
    And I navigate to "Appearance > Themes > Boost Union > Flavours" in site administration
    And I click on "Create flavour" "button"
    And I should see "Create flavour" in the "#page-header h1" "css_element"
    And I set the field "Title" to "My shiny new flavour"
    And I set the field "Description" to "<p>This is a great flavour</p>"
    And I click on "Save changes" "button"
    And I should see "Flavours" in the "#region-main h2" "css_element"
    And I click on "Edit" "button" in the "#region-main table" "css_element"
    And I should see "Edit flavour" in the "#page-header h1" "css_element"
    And I set the field "Title" to "My filthy old flavour"
    And I set the field "Description" to "<p>This is a not so great flavour</p>"
    And I click on "Save changes" "button"
    Then I should see "Flavours" in the "#region-main h2" "css_element"
    And I should see "My filthy old flavour" in the "#region-main table" "css_element"
    And I should see "This is a not so great flavour" in the "#region-main table" "css_element"

  Scenario: Flavours: Management - Delete existing flavours (until none is left anymore)
    When I log in as "admin"
    And I navigate to "Appearance > Themes > Boost Union > Flavours" in site administration
    And I click on "Create flavour" "button"
    And I should see "Create flavour" in the "#page-header h1" "css_element"
    And I set the field "Title" to "My shiny new flavour"
    And I click on "Save changes" "button"
    And I should see "Flavours" in the "#region-main h2" "css_element"
    And I click on "Create flavour" "button"
    And I should see "Create flavour" in the "#page-header h1" "css_element"
    And I set the field "Title" to "My filthy old flavour"
    And I click on "Save changes" "button"
    And I should see "Flavours" in the "#region-main h2" "css_element"
    And I click on "Delete" "button" in the "My shiny new flavour" "table_row"
    Then I should see "Delete flavour" in the "#page-header h1" "css_element"
    And I should see "Do you really want to delete the flavour My shiny new flavour?"
    And I click on "Delete" "button"
    And I should see "Flavours" in the "#region-main h2" "css_element"
    And I click on "Delete" "button" in the "My filthy old flavour" "table_row"
    And I should see "Delete flavour" in the "#page-header h1" "css_element"
    And I should see "Do you really want to delete the flavour My filthy old flavour?"
    And I click on "Delete" "button"
    And I should see "Flavours" in the "#region-main h2" "css_element"
    And I should see "There aren't any flavours created yet. Please create your first flavour to get things going."
    And "table" "css_element" should not exist in the "#region-main" "css_element"
    And "Create flavour" "button" should exist in the "#region-main" "css_element"
    And "Preview" "button" should not exist in the "#region-main" "css_element"
    And "Edit" "button" should not exist in the "#region-main" "css_element"
    And "Delete" "button" should not exist in the "#region-main" "css_element"

  Scenario: Flavours: Management - Cancel the creation of a new flavour
    When I log in as "admin"
    And I navigate to "Appearance > Themes > Boost Union > Flavours" in site administration
    And I click on "Create flavour" "button"
    And I should see "Create flavour" in the "#page-header h1" "css_element"
    And I click on "Cancel" "button"
    Then I should see "Flavours" in the "#region-main h2" "css_element"
    And I should see "There aren't any flavours created yet. Please create your first flavour to get things going."
    And "table" "css_element" should not exist in the "#region-main" "css_element"
    And "Create flavour" "button" should exist in the "#region-main" "css_element"
    And "Preview" "button" should not exist in the "#region-main" "css_element"
    And "Edit" "button" should not exist in the "#region-main" "css_element"
    And "Delete" "button" should not exist in the "#region-main" "css_element"

  Scenario: Flavours: Management - Cancel the editing of an existing flavour
    When I log in as "admin"
    And I navigate to "Appearance > Themes > Boost Union > Flavours" in site administration
    And I click on "Create flavour" "button"
    And I should see "Create flavour" in the "#page-header h1" "css_element"
    And I set the field "Title" to "My shiny new flavour"
    And I set the field "Description" to "<p>This is a great flavour</p>"
    And I click on "Save changes" "button"
    And I should see "Flavours" in the "#region-main h2" "css_element"
    And I click on "Edit" "button" in the "#region-main table" "css_element"
    And I should see "Edit flavour" in the "#page-header h1" "css_element"
    And I set the field "Title" to "My filthy old flavour"
    And I set the field "Description" to "<p>This is a not so great flavour</p>"
    And I click on "Cancel" "button"
    Then I should see "Flavours" in the "#region-main h2" "css_element"
    And I should see "My shiny new flavour" in the "#region-main table" "css_element"
    And I should see "This is a great flavour" in the "#region-main table" "css_element"

  Scenario: Flavours: Management - Cancel the deletion of an existing flavour
    When I log in as "admin"
    And I navigate to "Appearance > Themes > Boost Union > Flavours" in site administration
    And I click on "Create flavour" "button"
    And I should see "Create flavour" in the "#page-header h1" "css_element"
    And I set the field "Title" to "My shiny new flavour"
    And I click on "Save changes" "button"
    And I should see "Flavours" in the "#region-main h2" "css_element"
    And I click on "Delete" "button" in the "My shiny new flavour" "table_row"
    And I should see "Delete flavour" in the "#page-header h1" "css_element"
    And I should see "Do you really want to delete the flavour My shiny new flavour?"
    And I click on "Cancel" "button"
    Then I should see "Flavours" in the "#region-main h2" "css_element"
    And I should not see "There aren't any flavours created yet. Please create your first flavour to get things going."
    And "table" "css_element" should exist in the "#region-main" "css_element"
    And "Create flavour" "button" should exist in the "#region-main" "css_element"
    And "Preview" "button" should exist in the "#region-main table" "css_element"
    And "Edit" "button" should exist in the "#region-main table" "css_element"
    And "Delete" "button" should exist in the "#region-main table" "css_element"
    And I should see "My shiny new flavour" in the "#region-main table" "css_element"

  Scenario: Flavours: Management - Move existing flavours up and down
    When I log in as "admin"
    And I navigate to "Appearance > Themes > Boost Union > Flavours" in site administration
    And I click on "Create flavour" "button"
    And I should see "Create flavour" in the "#page-header h1" "css_element"
    And I set the field "Title" to "My shiny new flavour"
    And I click on "Save changes" "button"
    And I should see "Flavours" in the "#region-main h2" "css_element"
    And I click on "Create flavour" "button"
    And I should see "Create flavour" in the "#page-header h1" "css_element"
    And I set the field "Title" to "My filthy old flavour"
    And I click on "Save changes" "button"
    And I should see "Flavours" in the "#region-main h2" "css_element"
    And "My shiny new flavour" "table_row" should appear before "My filthy old flavour" "table_row"
    And I click on ".sort-flavour-up-action" "css_element" in the "My filthy old flavour" "table_row"
    Then "My shiny new flavour" "table_row" should appear after "My filthy old flavour" "table_row"
    And I click on ".sort-flavour-down-action" "css_element" in the "My filthy old flavour" "table_row"
    And "My shiny new flavour" "table_row" should appear before "My filthy old flavour" "table_row"
