require ('rspec')
require ('word')

describe '#Word' do

  before(:each) do
    Word.clear()
  end

  describe('.all') do
    it ("returns an empty array when there are no words") do
      expect(Word.all).to(eq([]))
    end
  end

  describe('#save') do
      it("saves an word") do
        word = Word.new("year", "the time in which a planet completes a revolution about the sun", nil)
        word.save()
        word2 = Word.new("month", "a measure of time corresponding nearly to the period of the revolution of moon and amounting to approximately 4 weeks or 30 days", nil)
        word2.save()
        expect(Word.all).to(eq([word, word2]))
      end
    end

    describe('#==') do
      it("is the same word if it has the same attributes as another word") do
        word = Word.new("month", "a measure of time corresponding nearly to the period of the revolution of moon and amounting to approximately 4 weeks or 30 days", nil)
        word2 = Word.new("month", "a measure of time corresponding nearly to the period of the revolution of moon and amounting to approximately 4 weeks or 30 days", nil)
        expect(word).to(eq(word2))
      end
    end

    describe('.clear') do
      it("clears all words") do
        word = Word.new("year", "the time in which a planet completes a revolution about the sun", nil)
        word.save()
        word2 = Word.new("month", "a measure of time corresponding nearly to the period of the revolution of moon and amounting to approximately 4 weeks or 30 days", nil)
        word2.save()
        Word.clear()
        expect(Word.all).to(eq([]))
      end
    end

    describe('.find') do
      it("finds an word by id") do
        word = Word.new("year", "the time in which a planet completes a revolution about the sun", nil)
        word.save()
        word2 = Word.new("month", "a measure of time corresponding nearly to the period of the revolution of moon and amounting to approximately 4 weeks or 30 days", nil)
        word2.save()
        expect(Word.find(word.id)).to(eq(word))
      end
    end

    describe('#update') do
      it("updates an word by id") do
        word = Word.new("year", "the time in which a planet completes a revolution about the sun", nil)
        word.save()
        word.update("Year", "the time in which a planet completes a revolution about the sun", nil)
        expect(word.name).to(eq("Year"))
      end
    end

    describe('#delete') do
      it("deletes an word by id") do
        word = Word.new("year", "the time in which a planet completes a revolution about the sun", nil)
        word.save()
        word2 = Word.new("month", "a measure of time corresponding nearly to the period of the revolution of moon and amounting to approximately 4 weeks or 30 days", nil)
        word2.save()
        word.delete()
        expect(Word.all).to(eq([word2]))
      end
    end

end
