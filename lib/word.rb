class Word
  @@list = []
  attr_reader :id
  attr_accessor :word, :definition,

  def initialize(word, definition)
    @word = word
    @definition = definition
    @id = @@list.length + 1
  end

  def self.all()
    @@list
  end

  def self.clear()
    @@list = []
  end

  def self.find(id)
    word_id = id.to_i()
    @@list.each do |word|
      if word.id == word_id
        return word
      end
    end
  end

  def save()
    if @@list.all? do |word|
      self.word != ""
      end
      @@list.push(self)
    end
  end

  def self.delete(id)
    word_id = id.to_i()
    @@list.map do |word_del|
      if word_del.id == word_id
        word_del.word = ""
      end
    end
  end

  def self.sort()
    @@list.sort_by! {|x| x.word}
  end

end
