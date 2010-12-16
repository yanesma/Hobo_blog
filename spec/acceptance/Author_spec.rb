require File.dirname(__FILE__) + '/acceptance_helper'

feature "Author CRUD", %q{
  As an Admin
  I want to CRUD authors
} do

background {@attrs = Factory.attributes_for(:author)}

  describe "When admin, " do
    background do
      @admin = Factory(:admin)
      login_as(@admin)
    end

    describe "With nothing, " do
      describe "At list, " do
        background {visit '/authors'}
        scenario "I browse" do
          page.should_not have_content(@attrs[:name])
        end
        scenario "I create" do
          click_link('New Author')
          fill_in 'author[name]', :with => @attrs[:name]
          click_button 'Create Author'
          visit('/authors')
          within('.collection.authors .card.author') do
            page.should have_content @attrs[:name]
          end
        end
      end
    end

    describe "With a record, " do
      background {@author = Factory(:author)}
      describe "At list, " do
        background {visit '/authors'}
        scenario "I browse" do
          within('.collection.authors .card.author') do
            page.should have_content(@author.name)
          end
          page.should_not have_content(@attrs[:name])
        end
        describe "At show, " do
          background do
            within('.collection.authors .card.author') do
              click_link @author.name
            end
          end
          scenario "I read" do
            page.should have_content @author.name
          end
          describe "At edit, " do
            background {find('.edit-link.author-link').click}
            scenario "I update" do
              fill_in 'author[name]', :with => @attrs[:name]
              click_button 'Save'
              visit('/authors')
              within('.collection.authors .card.author') do
                page.should have_content @attrs[:name]
              end
            end
            scenario "I delete" do
              find('.delete-button').click
              visit('/authors')
                page.should_not have_css('.collection.authors .card.author')
                page.should_not have_content(@author.name)
            end
          end
        end
      end
    end

  end

#   describe "When guest, " do
#   end

end


