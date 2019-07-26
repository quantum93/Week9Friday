require 'rspec'
require 'definition'
require 'word'
require 'pry'

describe '#Definition' do

  before(:each) do
    Word.clear()
    Definition.clear()
    @word = Word.new("year", "the time in which a planet completes a revolution about the sun", nil)
    @word.save()
  end

  describe('#==') do
    it("is the same definition if it has the same attributes as another definition") do
      definition = Definition.new("the time in which a planet completes a revolution about the sun", @word.id, nil)
      definition2 = Definition.new("the time in which a planet completes a revolution about the sun", @word.id, nil)
      expect(definition).to(eq(definition2))
    end
  end

  describe('.all') do
    it("returns a list of all definitions") do
      definition = Definition.new("year", @word.id, nil)
      definition.save()
      definition2 = Definition.new("month", @word.id, nil)
      definition2.save()
      expect(Definition.all).to(eq([definition, definition2]))
    end
  end

  describe('.clear') do
    it("clears all definitions") do
      definition = Definition.new("year", @word.id, nil)
      definition.save()
      definition2 = Definition.new("month", @word.id, nil)
      definition2.save()
      Definition.clear()
      expect(Definition.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a definition") do
      definition = Definition.new("month", @word.id, nil)
      definition.save()
      expect(Definition.all).to(eq([definition]))
    end
  end

  describe('.find') do
    it("finds a definition by id") do
      definition = Definition.new("year", @word.id, nil)
      definition.save()
      definition2 = Definition.new("month", @word.id, nil)
      definition2.save()
      expect(Definition.find(definition.id)).to(eq(definition))
    end
  end

  describe('#update') do
    it("updates an definition by id") do
      definition = Definition.new("a measure of time corresponding nearly to the period of the revolution of moon and amounting to approximately 4 weeks or 30 days", @word.id, nil)
      definition.save()
      definition.update("one ninth of the typical duration of human pregnancy", @word.id)
      expect(definition.name).to(eq("one ninth of the typical duration of human pregnancy"))
    end
  end

  describe('#delete') do
    it("deletes an definition by id") do
      definition = Definition.new("year", @word.id, nil)
      definition.save()
      definition2 = Definition.new("month", @word.id, nil)
      definition2.save()
      definition.delete()
      expect(Definition.all).to(eq([definition2]))
    end
  end

  describe('.find_by_word') do
    it("finds definitions for an word") do
      word2 = Word.new("year", "the time in which a planet completes a revolution about the sun", nil)
      word2.save
      definition = Definition.new("a measure of time corresponding nearly to the period of the revolution of moon and amounting to approximately 4 weeks or 30 days", @word.id, nil)
      definition.save()
      definition2 = Definition.new("one ninth of the typical duration of human pregnancy", word2.id , nil)
      definition2.save()
      expect(Definition.find_by_word(word2.id)).to(eq([definition2]))
    end
  end

  describe('#definitions') do
      it("returns an word's definitions") do
        word = Word.new("year", "the time in which a planet completes a revolution about the sun", nil)
        word.save()
        definition = Definition.new("a measure of time corresponding nearly to the period of the revolution of moon and amounting to approximately 4 weeks or 30 days", word.id, nil)
        definition.save()
        definition2 = Definition.new("one ninth of the typical duration of human pregnancy", word.id, nil)
        definition2.save()
        expect(word.definitions).to(eq([definition, definition2]))
      end
    end

    describe('#word') do
  it("finds the word a definition belongs to") do
    definition = Definition.new("a measure of time corresponding nearly to the period of the revolution of moon and amounting to approximately 4 weeks or 30 days", @word.id, nil)
    definition.save()
    expect(definition.word()).to(eq(@word))
  end
end

end
