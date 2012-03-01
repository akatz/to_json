class NilKeyForHashError < RuntimeError
end
module Extensions
  class ::String
    def to_json
      "\"" << self << "\""
    end
  end

  class ::Fixnum
    def to_json
      self.to_s
    end
  end

  class ::Array
    def to_json
      if self.size > 0
        json = "["
        self.each do |x|
          json << x.to_json << ","
        end
        json = json.chop
        json << "]"
      end
      json || "[]"
    end
  end

  class ::Hash
    def to_json
      raise NilKeyForHashError if self.keys.include?(nil)
      json = "{"
      self.each {|k,v| json << "#{k.to_json}:#{v.to_json}"} 
      json << "}"
    end
  end
  class ::NilClass
    def to_json
      "NaN"
    end
  end
end
