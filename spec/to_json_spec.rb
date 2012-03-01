require(File.dirname(File.expand_path(__FILE__)) + '/../lib/to_json')

describe String do

  it "should convert a string to json" do
    "string".to_json.should == "\"string\""
  end
  it "should convert a number string into json" do
    "1".to_json.should == "\"1\""
  end
end

describe Fixnum do
  
  it "should convert a Fixnum to json" do
    1.to_json.should == "1"
  end

end

describe Array do
  it "should convert an empty array to a proper json string" do
    [].to_json.should == "[]"
  end

  it "should convert an array of numbers into a json array of characters representing those numbers" do
    [1,2].to_json.should == "[1,2]"
  end
  it "should convert an array of strings into a json array containging those strings" do
    ["a","bb"].to_json.should == "[\"a\",\"bb\"]"
  end

  it "should convert an array of arrays into proper json" do
    [1,2,[3,4]].to_json.should == "[1,2,[3,4]]"
  end
  it "should convert an array of hashes correctly" do
    [{"a" => 1}, {"b" => 2}].to_json.should == "[{\"a\":1},{\"b\":2}]"
  end
end

describe Hash do
  it "should convert a hash into valid json" do
    {"new" => "hash"}.to_json.should == "{\"new\":\"hash\"}"
  end
  it "should convert nested hashes correctly to json" do
    {"new" => { "hash" => "test"}}.to_json.should == "{\"new\":{\"hash\":\"test\"}}"
  end
  it "should convert a hash with a nested array correctly" do
    {"a" => [1,2]}.to_json.should == "{\"a\":[1,2]}" 
  end
  it "should convert a hash of number key => values correctly" do
    {1 => 2}.to_json.should == "{1:2}"
  end
end
