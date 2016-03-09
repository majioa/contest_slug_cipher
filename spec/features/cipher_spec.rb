require 'rails_helper'

RSpec.describe "the cipher calc process", type: :feature do
   context "calcs cipher" do
      before do
         user = create :user
         @slug =  user.slug
      end

      it do
         visit "/cipher/#{@slug}"
         within("form") do
            fill_in 'Text', :with => 'ABCDZ'
            fill_in 'Digit', :with => '27'
         end

         click_button 'Create'

         within("#cipher") do
            expect(body).to have_text("BCDEA")
         end
      end
   end
end
