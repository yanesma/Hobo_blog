require File.dirname(__FILE__) + '/../test_helper'

class PostTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  context "a Post" do
    setup do
      @post = Factory(:post)
      
    end

    should "respond to #{:title}" do
      assert @post.respond_to? :title
    end

     should "respond to #{:post_date}" do
      assert @post.respond_to? :post_date
    end
     should "respond to #{:content}" do
      assert @post.respond_to? :content
    end

    should "be save" do
      assert @post.save
    end

    should "have title" do
        assert_not_nil @post.title
    end

     should "have content" do
        assert_not_nil @post.content
    end

     should "have post date" do
        assert_not_nil @post.post_date
    end

  end

end
