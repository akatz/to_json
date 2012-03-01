require(File.dirname(File.expand_path(__FILE__)) + '/../lib/parser')
describe JSON do
  it "should parse empty json as nil" do
    JSON.parse("{}").should == {}
  end
  it "should parse an empty string as nil" do
    JSON.parse("").should == nil
  end
  it "should parse an empty array as a new array" do
    JSON.parse("[]").should == []
  end

  it "should parse a single text element correctly" do
    JSON.parse("test").should == "test"
  end
  it "should not match a single string array" do
    pending
    JSON.parse("[\"test\"]").should == ["test"]
  end
end
