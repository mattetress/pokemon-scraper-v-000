class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(info_hash)
    info_hash.each { |k, v| self.send("#{k}=", v) }
  end

  def self.save(pokemon, type, db)
    db.execute("INSERT INTO pokemon (name, type)",pokemon, type)
  end
end
