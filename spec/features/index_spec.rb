require 'rails_helper'

RSpec.describe "the signin process", :type => :feature do
   it "creates a user" do
      visit '/'
      within("form") do
         fill_in 'Name', :with => 'John Joe'
      end

      click_button 'Create'

      user = User.where(name: 'John Joe').first

      expect(current_path).to eq("/cipher/#{user.slug}")
      expect(body).to have_text("Greeting,#{user.name}")
   end
end
