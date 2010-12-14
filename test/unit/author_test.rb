require File.dirname(__FILE__) + '/../test_helper'

class AuthorTest < ActiveSupport::TestCase
 context "ActiveRecord" do
    setup { Factory(:author)}
    should validate_uniqueness_of( :name )
    should have_many(:posts)
    should validate_presence_of(:name)

  end
  context "An Organization" do
    setup { @author = Factory(:author)}
    should "do something"
    should "do anotherthing"
  end

end
