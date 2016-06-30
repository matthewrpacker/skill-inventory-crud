require_relative '../test_helper'

class UserCanCreateASkillTest < FeatureTest

  def test_user_can_create_skill
    #As a user
    # When I visit the dashboard
    visit '/'
    # And I click the link "New Skill"
    click_link "New Skill"
    # Then I should be on the new skills page
    assert_equal "/skills/new", current_path
    # And I fill in the name field with "new skill"
    fill_in "skill[name]", with: "new skill"
    # And I fill in the description field with "new discription"
    fill_in "skill[description]", with: "new description"
    # And I clik the Save button
    click_button("Save")
    assert_equal "/skills", current_path
    # Then I should see the list of skills and a All Skills header
    assert page.has_css?("#name")
    assert page.has_content?("Skills")
  end
  
end
