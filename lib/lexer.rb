module JSON
  class Lexer
    TOKENS = /\{|\}|\[|\]|,|:|\"/
    def initialize(string)
      @string = string
    end

    def tokenize
      @tokens = []
      require 'strscan'
      ss = StringScanner.new(@string)
      loop do
        word = ss.scan(TOKENS)
        @tokens << word.split unless word.nil?
        sep = ss.scan(/\w+/)     # Grab next non-word piece
        @tokens << sep unless sep.nil?
        ss.scan(/\s/) if word.nil? && sep.nil?
        break if ss.eos? 
      end
      @tokens.flatten!.compact!
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
