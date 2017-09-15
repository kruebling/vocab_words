require('rspec')
require('word')
require('pry')

describe("Word") do
  before() do
    Word.clear()
  end

  describe(".all") do
    it("is empty at first") do
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("saves an word to the list of items") do
      word = Word.new("dog", "cat")
      word.save()
      expect(Word.all()).to(eq([word]))
    end
  end

  describe(".clear") do
    it("clears all items from the list") do
      word = Word.new("dog", "cat")
      word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe("#id") do
    it("increments an id by 1 each time a new word is added") do
      word = Word.new("dog", "cat")
      word.save()
      word2 = Word.new("dog", "cat")
      word2.save()
      expect(word.id()).to(eq(1))
      expect(word2.id()).to(eq(2))
    end
  end
end
