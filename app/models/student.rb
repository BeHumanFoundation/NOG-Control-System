class Student < ActiveRecord::Base
  has_many :lessons
  has_many :faults
  has_and_belongs_to_many :subjects
  accepts_nested_attributes_for :subjects
  belongs_to :responsible



  validates :name,presence: true
  validates :phone,presence: true
  validates :rg,presence: true

end
