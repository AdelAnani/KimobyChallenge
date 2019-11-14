class ConcatenatedWordListGenerator
  attr_accessor :concatenatedWordList, :firstWordList, :secondWordList, :temporaryWordList

  def initialize()
    @temporaryWordList = []
    @concatenatedWordList = []
  end

  def defineConcatenatedWordList(wordList, firstWordList, secondWordList)
    for firstWord in firstWordList do
      for word in wordList do
          if word[0, firstWord.size] == firstWord
          @temporaryWordList.push(word)
        end
      end
    end

    for secondWord in secondWordList do
      for otherWord in @temporaryWordList do
        if otherWord[firstWord.size, secondWord.size] == secondWord
          @concatenatedWordList.push(otherWord)
        end
      end
    end
  end

end

class TextFileParser
  attr_accessor :textFilePath, :sixCharacterWordList, :fourCharacterWordList,
                :threeCharacterWordList, :twoCharacterWordList, :wordListHashMap

  def initialize(textFilePath)
    @textFilePath = textFilePath
    @sixCharacterWordList = []
    @fourCharacterWordList = []
    @threeCharacterWordList = []
    @twoCharacterWordList = []
    @wordListHashMap = Hash.new
    @wordListHashMap[6] = @sixCharacterWordList
    @wordListHashMap[4] = @fourCharacterWordList
    @wordListHashMap[3] = @threeCharacterWordList
    @wordListHashMap[2] = @twoCharacterWordList
  end

  def textFileToListOfWord()
    rawTextFile = File.read(@textFilePath).split

    rawTextFile.each do |line|
      if line.length <= 6 and line.length >= 2 and line.length != 5
        @wordListHashMap[line.length].push(line)
      end
    end
  end

end

if __FILE__ == $0
  textFilePath = "dictionary.txt"
  textFileParser = TextFileParser.new(textFilePath)
  textFileParser.textFileToListOfWord

  concatenatedWordListGenerator = ConcatenatedWordListGenerator.new

  concatenatedWordListGenerator.defineConcatenatedWordList(textFileParser.sixCharacterWordList,
                                                           textFileParser.twoCharacterWordList,
                                                           textFileParser.fourCharacterWordList)

  concatenatedWordListGenerator.defineConcatenatedWordList(textFileParser.sixCharacterWordList,
                                                           textFileParser.fourCharacterWordList,
                                                           textFileParser.twoCharacterWordList)

  concatenatedWordListGenerator.defineConcatenatedWordList(textFileParser.sixCharacterWordList,
                                                           textFileParser.threeCharacterWordList,
                                                           textFileParser.threeCharacterWordList)
  puts concatenatedWordListGenerator.temporaryWordList.length
end
