require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  include TestHelpers

  def skill_inventory_empty
    assert_equal 0, SkillInventory.all.count
  end

  def test_it_creates_a_skill
    SkillInventory.create({
      :name       => "a name",
      :description => "a description"
      })

      skill = SkillInventory.find(1)
      assert_equal "a name", skill.name
      assert_equal "a description", skill.description
      assert_equal 1, skill.id
      assert_instance_of Skill, skill
    end

    def test_it_returns_all_skills
      skill_inventory_empty

      SkillInventory.create({name: "golf", description: "play golf"})
      SkillInventory.create({name: "jump rope", description: "can jump rope"})
      SkillInventory.create({name: "drive car", description: "can drive car"})

      SkillInventory.all.each do |skill|
        assert_instance_of Skill, skill
      end
    end

    def test_it_can_find_skills
      SkillInventory.create({name: "golf", description: "play golf"})
      SkillInventory.create({name: "jump rope", description: "can jump rope"})
      SkillInventory.create({name: "drive car", description: "can drive car"})

      skill = SkillInventory.find(2)

      assert_equal "jump rope", skill.name
      assert_equal "can jump rope", skill.description
    end

    def test_it_can_update_a_skill
      SkillInventory.create({name: "golf", description: "play golf"})

      SkillInventory.update(1, {name: "basketball", description: "play basketball"})

      skill = SkillInventory.find(1)

      assert_equal "basketball", skill.name
      assert_equal "play basketball", skill.description
    end

    def test_destroy
      skill_inventory_empty
      SkillInventory.create({name: "jump rope", description: "can jump rope"})
      SkillInventory.destroy(1)
      skill_inventory_empty
    end


  end
