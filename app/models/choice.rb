class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :users_selections
  has_many :users, through: :users_selections
end
