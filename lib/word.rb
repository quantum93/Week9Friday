require ('pry')

class Word
  attr_reader :id
  attr_accessor :name, :definition
  @@words = {}
  @@total_rows = 0

  def initialize(name, definition, id)
    @name = name
    @definition = definition
    @id = id || @@total_rows += 1
  end

  def self.all
    @@words.values()
  end

  def save
    @@words[self.id] = Word.new(self.name, self.definition, self.id)
  end

  def == (word_to_compare)
    self.name() == word_to_compare.name()
    self.definition() == word_to_compare.definition()
  end

  def self.clear
    @@words = {}
    @@total_rows = 0
  end

  def self.find(id)
    @@words[id]
  end

  def self.search(name)
    @@words.values.select do |word|
    word.name == name
    end
  end

  def update(name, definition, id)
    self.name = name
    self.definition = definition
    @@words[self.id] = Word.new(self.name, self.definition, self.id)
  end

  def delete
    @@words.delete(self.id)
  end

  def definitions
    Definition.find_by_word(self.id)
  end
end
