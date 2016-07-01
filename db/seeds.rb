require 'sqlite3'
database = SQLite3::Database.new("db/skill_inventory_development.db")

#Delete existing records from the skills table before inserting these new records; we'll start from scratch.
database.execute("DELETE FROM skills;")

# Insert records.
database.execute(
                "INSERT INTO skills
          (name, description)
        VALUES
          ('golf', 'I can golf'),
          ('jump rope', 'I can jump rope'),
          ('read', 'I can read'),
          ('drive', 'I can drive a car');"

)

# verifying that our SQL INSERT statement worked
puts "It worked and:"
p database.execute("SELECT * FROM skills;")

#good place to use faker gem
