require File.dirname(__FILE__) + '/../spec_helper'

describe Feedzirra::AtomEntry do
  before(:each) do
    # I don't really like doing it this way because these unit test should only rely on AtomEntry,
    # but this is actually how it should work. You would never just pass entry xml straight to the AtomEnry
    @entry = Feedzirra::AtomFeedBurner.parse(sample_feedburner_atom_feed).entries.first
  end
  
  it "should parse the title" do
    @entry.title.should == "Making a Ruby C library even faster"
  end
  
  it "should parse the url" do
    @entry.url.should == "http://www.pauldix.net/2009/01/making-a-ruby-c-library-even-faster.html"
  end
  
  it "should parse the author" do
    @entry.author.should == "Paul Dix"
  end
  
  it "should parse the content" do
    @entry.content.should == sample_feedburner_atom_entry_content
  end
  
  it "should provide a summary" do
    @entry.summary.should == "Last week I released the first version of a SAX based XML parsing library called SAX-Machine. It uses Nokogiri, which uses libxml, so it's pretty fast. However, I felt that it could be even faster. The only question was how..."
  end
  
  it "should parse the published date" do
    @entry.published.to_s.should == "Thu Jan 22 15:50:22 UTC 2009"
  end
end