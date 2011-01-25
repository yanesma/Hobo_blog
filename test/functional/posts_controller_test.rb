require File.dirname(__FILE__) + '/../test_helper'



class PostsControllerTest < ActionController::TestCase
  context "Security:  " do
    setup {
      @post = Factory(:post)
      @attrs = Factory.attributes_for(:post) }
    context "Guest" do
      #setup {login_as somebody}
      context "(read_actions)" do
        should "get index" do
          get :index
          assert_response :success
        end
        should "get show" do
          get :show, :id=>@post.id
          assert_response :success
        end
      end
      context "(edit actions)" do
        should "not get new" do
          get :new
          assert_response :success
          assert_no_tag :tag=>'form'
        end
        should "not get edit" do
          get :edit, :id=>@post.id
          assert_response :success
          assert_no_tag :tag=>'form'
        end
      end
      context "(write_actions)" do
        should "not post create" do
          count1 = Post.count
          post :create, :post => @attrs
          count2 = Post.count
          assert_equal count1, count2, "Nothing created"
          assert_response :forbidden
        end
        should "not put update" do
          put :update, :id=>@post.id, :post => @attrs
          assert_response :forbidden
        end
        should "not delete" do
          delete :destroy, :id=>@post.id
          assert_response :forbidden
        end
      end
    end

    context "author1" do
      setup do
        @user1 = Factory(:user)
        login_as @user1
        @author1 = Factory(:author)
      end
      context "(write_actions)" do
        should "post create" do
          count1 = Post.count
          post :create, :post => {:post_date=>@attrs[:post_date] ,:title=>@attrs[:title],:content=>@attrs[:content], :author=> @author1}
          #puts @attrs[:post_date]
          count2 = Post.count
          assert_not_equal count1, count2, "created"
          assert_response :redirect
        end
  
        context "author2" do
          setup do
            @user2 = Factory(:user)
            login_as @user2
            @author2 = Factory(:author)
          end
          should "not get edit" do
            get :edit, :id=>@post.id, :author=> @author2
            assert_response :success
            assert_no_tag :tag=>'form'
          end

          should " not put update" do
            put :update, :id=>@post.id, :post => @attrs, :author=> @author1
            assert_response :forbidden
          end

          should "not delete" do
            delete :destroy, :id=>@post.id
            assert_response :forbidden
          end
        end
      
      end
    end
  end
end
