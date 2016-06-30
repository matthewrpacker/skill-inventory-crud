require_relative '../test_helper'

class UserSeesSkillsTest < FeatureTest

  def test_user_sees_index_of_skills
    skill1 = SkillInventory.create({
      name: "Coding is cool",
      description: "I know it's cool"
      })

    skill2 = SkillInventory.create({
        name: "Learn capybara",
        description: "Swim in hottub"
        })
    # As a user
    # When I visit the skills index
    visit '/skills'
    # Then I should see a list of my skills and only their names
    within('#skill_list') do
      assert page.has_content?("Coding is cool")
      assert page.has_content?("Learn capybara")
    end
  end
end
