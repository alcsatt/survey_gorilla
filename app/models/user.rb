class User < ActiveRecord::Base
  has_many :created_surveys, foreign_key: :creator_id
  has_many :taken_surveys
  has_many :surveys, through: :taken_surveys
  has_many :users_selections
  has_many :choices, through: :users_selections
end
