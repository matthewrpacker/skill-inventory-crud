require 'sqlite3'

class SkillInventory

  # def self.$db
  #   @$db ||= YAML::Store.new("db/skill_inventory")
  # end

  # def self.$db
  #   if ENV['RACK_ENV'] == 'test'
  #     @$db = SQLite3::$db.new("db/skill_inventory_test.db")
  #   else
  #     @$db = SQLite3::$db.new("db/skill_inventory_development.db")
  #   end
  #   @$db.results_as_hash = true
  #
  #   # SkillInventory.new($db)
  # end


  def self.create(skill)
    $db.execute("INSERT INTO skills (name, description)
      VALUES (?, ?);", skill[:name], skill[:description])

    # $db.transaction do
    #   $db['skills'] ||= []
    #   $db['total'] ||= 0
    #   $db['total'] += 1
    #   $db['skills'] << { "id" => $db['total'], "name" => skill[:name], "description" => skill[:description]}
    # end
  end


  def self.raw_skills
    $db.execute("SELECT * FROM skills;")

    # $db.transaction do
    #   $db['skills'] || []
    # end
  end

  def self.all
    raw_skills.map { |data| Skill.new(data) }
  end

  def self.raw_skill(id)
    raw_skills.find { |skill| skill["id"] == id }
  end

  def self.find(id)
    Skill.new(raw_skill(id))
  end

  def self.update(id, skill)
    $db.execute("UPDATE skills SET name= ?,
      description= ? WHERE id = ?;", skill[:name], skill[:description], id)

    # $db.transaction do
    #   selected_skill = $db['skills'].find {|data| data["id"] == id }
    #   selected_skill["name"] = skill[:name]
    #   selected_skill["description"] = skill[:description]
    # end
  end

  def self.destroy(id)
    $db.execute("DELETE FROM skills WHERE id = ?;", id)

    # $db.transaction do
    #   $db['skills'].delete_if { |skill| skill["id"] == id }
    # end
  end

  def self.delete_all
    $db.execute("DELETE FROM skills")

    # $db.transaction do
    #   $db['skills'] = []
    #   $db['total'] = 0
    # end
  end
end
