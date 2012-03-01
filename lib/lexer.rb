module JSON
  class Lexer
    TOKENS = /\{|\}|\[|\]|,|:|\"/
    def initialize(string)
      @string = string
    end

    def tokenize
      @tokens = []
      pos = 0
      word = false
      word_arr = []
      until pos == @string.size
        if @string[pos].match(TOKENS)
          if word == true
            @tokens << word_arr.join
            word_arr = []
          end
          @tokens << @string[pos].to_s 
          word = false
        end
        if pos == @string.size-1 && word == true
            @tokens << word_arr.join
        end
        
        if @string[pos].match /\w/
          word = true
          word_arr << @string[pos]
        end
        pos = pos+1
      end
      @tokens
    end

    def to_ruby
      curr = ""
      until curr.match(TOKENS) || curr.match(/\w/)
        curr = @tokens.shift
        if curr == "\""
          @tokens.pop
        else
          @tokens.unshift(curr)
        end
      end
      if curr.match(TOKENS)
        if curr.match(/\[/)
        end
      end
      @tokens.join
    end
  end
end
