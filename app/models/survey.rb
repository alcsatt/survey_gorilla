class Survey < ActiveRecord::Base
  belongs_to :creator, classname: "User"
  has_many :questions
  has_many :taken_surveys
  has_many :users, through: :taken_surveys
end
