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
      word = Word.new()
      word.save()
      expect(Word.all()).to(eq([word]))
    end
  end

  describe(".clear") do
    it("clears all items from the list") do
      word = Word.new()
      word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end
end
