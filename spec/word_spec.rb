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
      word = Word.new("Ruby", "Ruby is a dynamic, reflective, object-oriented, general-purpose programming language")
      word.save()
      expect(Word.all()).to(eq([word]))
    end
  end

  describe('#add_definition') do
    it('adds a definition to a word') do
      word = Word.new("Ruby", "Ruby is a dynamic, reflective, object-oriented, general-purpose programming language")
      word.save()
      word.add_definition("Ruby sometimes doesnt work the way I think it will...")
      expect(word.definitions).to(eq(["Ruby is a dynamic, reflective, object-oriented, general-purpose programming language", "Ruby sometimes doesnt work the way I think it will..."]))
    end
  end

  describe(".clear") do
    it("clears all items from the list") do
      word = Word.new("Ruby", "Ruby is a dynamic, reflective, object-oriented, general-purpose programming language")
      word.save()
      Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end

  describe(".delete") do
    it("locates the word by its id index and sets the vocab variable equal to empty strings") do
      word = Word.new("Ruby", "Ruby is a dynamic, reflective, object-oriented, general-purpose programming language")
      word.save()
      Word.delete(word.id)
      expect(Word.all[0].vocab()).to(eq(""))
    end
  end

  describe("#sort") do
    it("sorting the word objects by their vocab variables") do
      word1 = Word.new("Ruby", "Ruby is a dynamic, reflective, object-oriented, general-purpose programming language")
      word1.save()
      word2 = Word.new("Python", "Python is a widely used high-level programming language for general-purpose programming")
      word2.save()
      Word.sort()
      expect(Word.all()).to(eq([word2, word1]))
    end
  end

  describe("#id") do
    it("increments an id by 1 each time a new word is added") do
      word = Word.new("Ruby", "Ruby is a dynamic, reflective, object-oriented, general-purpose programming language")
      word.save()
      word2 = Word.new("Python", "Python is a widely used high-level programming language for general-purpose programming")
      word2.save()
      expect(word.id()).to(eq(1))
      expect(word2.id()).to(eq(2))
    end
  end

  describe("#attr_accessor") do
      it("reads the instance variable") do
        word = Word.new("Ruby", "Ruby is a dynamic, reflective, object-oriented, general-purpose programming language")
        expect(word.vocab()).to(eq("Ruby"))
      end
    end

  describe("#attr_accessor") do
    it("writes the instance variable") do
      word = Word.new("Ruby", "Ruby is a dynamic, reflective, object-oriented, general-purpose programming language")
      word.vocab = "Python"
      expect(word.vocab).to(eq("Python"))
    end
  end
end
