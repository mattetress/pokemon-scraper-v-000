class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(info_hash)
    info_hash.each { |k, v| self.send("#{k}=", v) }
  end

  def self.save(pokemon, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",pokemon, type)
  end

  def self.find(id, db)
    pokemon_info = {}
    db_return = db.execute("SELECT * FROM pokemon WHERE id = ?",id)
    pokemon_info[:id] = db_return[0][0]
    pokemon_info[:name] = db_return[0][1]
    pokemon_info[:type] = db_return[0][2]
    binding.pry
  end
end
