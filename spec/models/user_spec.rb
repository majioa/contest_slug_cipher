require 'rails_helper'

RSpec.describe User, type: :model do
   context "shoulda" do
      it { expect(subject).to have_db_column(:name).of_type(:string) }
      it { expect(subject).to have_db_column(:slug).of_type(:string) }
   end
end
