require(File.dirname(File.expand_path(__FILE__)) + '/../lib/lexer')

describe JSON::Lexer do
  it "should recognize strings" do
    @lexer = JSON::Lexer.new("\"w00t\"")
    @lexer.tokenize.should == ["\"","w00t","\""]
  end
  it "should recognize arrays" do
    @lexer = JSON::Lexer.new("[\"w00t\"]")
    @lexer.tokenize.should == ["[","\"","w00t","\"","]"]
  end
  it "should recognize nested arrays" do
    @lexer = JSON::Lexer.new("[\"w00t\",[\"w00t\"]]")
    @lexer.tokenize.should == ["[","\"","w00t","\"",",","[","\"","w00t","\"","]","]"]
  end
  it "should recognize hashes" do
    @lexer = JSON::Lexer.new("{\"w00t\":\"test\"}")
    @lexer.tokenize.should == ["{","\"","w00t","\"",":","\"","test","\"","}"]
  end
  it "should recognize nested hashes do" do
    @lexer = JSON::Lexer.new("{\"w00t\":{\"w00t\":\"test\"}}")
    @lexer.tokenize.should == ["{","\"","w00t","\"",":","{","\"","w00t","\"",":","\"","test","\"","}","}"]
  end
  it "should ignore whitespace" do
    @lexer = JSON::Lexer.new("{\"w00t\": \"test\"}")
    @lexer.tokenize.should == ["{","\"","w00t","\"",":","\"","test","\"","}"]
  end
  it "should be able to convert a list of tokens to ruby" do
    @lexer = JSON::Lexer.new("\"w00t\"")
    @lexer.tokenize
    @lexer.to_ruby.should == "w00t"
  end
  it "should convert a list of tokens containing array symbols to arrays" do
    pending("this is gonna be where things start getting tricky")
    @lexer = JSON::Lexer.new("[\"w00t\"]")
    @lexer.tokenize
    @lexer.to_ruby.should == ["w00t"]
  end
end
