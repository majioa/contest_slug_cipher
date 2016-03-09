class Message < ActiveRecord::Base
  belongs_to :user

  before_save proc { self.text = self.text.upcase }
end
