module JSON
  def self.parse(json)
    @json = nil
    @json = check_for_strings(json)
    @json = Hash.new(json) if json.match(/^\{/)
    @json = Array.new() if json.match(/^\[\]/)
    @json 
  end
  def self.check_for_strings(json)
    matchdata = json.match(/(\w+)/)
    matchdata.captures.first if matchdata
  end
end
