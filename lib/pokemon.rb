class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(info_hash)
    info_hash.each { |k, v| self.send("#{k}=", v) }
  end

  def self.save(pokemon, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",pokemon, type)
  end

  def self.find(id, db)
    Pokemon.new(db.execute("SELECT * FROM pokemon WHERE id = ?",id))
  end
end
