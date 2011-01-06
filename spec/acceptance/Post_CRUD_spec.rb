require File.dirname(__FILE__) + '/acceptance_helper'

feature "Post CRUD", %q{
  As an Admin
  I want to CRUD Posts
} do

background {@attrs = Factory.attributes_for(:post)
  @user = Factory.attributes_for(:user)

}

  describe "when sign up" do
    background do
       click_link('Sign up')
       fill_in 'user[name]', :with => "testuser"
          fill_in 'user[email_address]', :with => @user[:email_address]
    end

    describe "with nothing" do

    end
  end


  describe "When admin, " do
    background do
      @admin = Factory(:admin)
      login_as(@admin)
    end

    describe "With nothing, " do
      describe "At list, " do
        background {visit '/posts'}
        scenario "I browse" do
          page.should_not have_content(@attrs[:title])
        end
        scenario "I create" do
          click_link('New Post')
          fill_in 'post[title]', :with => @attrs[:title]
          fill_in 'post[content]', :with => @attrs[:content]
          click_button 'Create Post'
          visit('/posts')
          within('.collection.posts .card.post') do
            page.should have_content @attrs[:title]
          end
        end
      end
    end

    describe "With a record, " do
      background {@post = Factory(:post)}
      describe "At list, " do
        background {visit '/posts'}
        scenario "I browse" do
          within('.collection.posts .card.post') do
            page.should have_content(@post.title)
          end
          page.should_not have_content(@attrs[:title])
        end
        describe "At show, " do
          background do
            within('.collection.posts .card.post') do
              click_link @post.title
            end
          end
          scenario "I read" do
            page.should have_content @post.title
          end
          describe "At edit, " do
            background {find('.edit-link.post-link').click}
            scenario "I update" do
              fill_in 'post[title]', :with => @attrs[:title]
              click_button 'Save'
              visit('/posts')
              within('.collection.posts .card.post') do
                page.should have_content @attrs[:title]
              end
            end
            scenario "I delete" do
              find('.delete-button').click
              visit('/posts')
                page.should_not have_css('.collection.posts .card.post')
                page.should_not have_content(@post.title)
            end
          end
        end
      end
    end

    describe "when author " do
      describe "With a record, " do
      background {@post = Factory(:post)}
      describe "At list, " do
        background {visit '/posts'}
        scenario "I browse" do
          within('.collection.posts .card.post') do
            page.should have_content(@post.title)
          end
          page.should_not have_content(@attrs[:title])
        end
        describe "At show, " do
          background do
            within('.collection.posts .card.post') do
              click_link @post.title
            end
          end
          scenario "I read" do
            page.should have_content @post.title
          end
          describe "At edit, " do
            background {find('.edit-link.post-link').click}
            scenario "I update" do
              fill_in 'post[title]', :with => @attrs[:title]
              click_button 'Save'
              visit('/posts')
              within('.collection.posts .card.post') do
                page.should have_content @attrs[:title]
              end
            end
            scenario "I delete" do
              find('.delete-button').click
              visit('/posts')
                page.should_not have_css('.collection.posts .card.post')
                page.should_not have_content(@post.title)
            end
          end
        end
      end
    end
    end

  end

#   describe "When guest, " do
#   end

end


