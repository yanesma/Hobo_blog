require File.dirname(__FILE__) + '/../test_helper'

class AuthorTest < Test::Unit::TestCase
  context "an Author" do
    setup do
      @Author = Author.new
    end

    should "respond to #{:name}" do
      assert @Author.respond_to? :name
    end

    context "instance " do
      setup do
        @Author = Author.new(:name=>"JKRowling")
      end
      should "have name" do
        assert_not_nil @Author.name
        assert_equal "JKRowling", @Author.name
      end

      should "be saved" do
        assert @Author.save
      end
    end
  end
  
end
