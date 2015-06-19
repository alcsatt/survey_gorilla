class UserSelection < ActiveRecord::Base
  belongs_to :choice
  belongs_to :user
end
