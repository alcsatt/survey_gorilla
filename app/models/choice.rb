class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :user_selections
  has_many :users, through: :user_selections
end
