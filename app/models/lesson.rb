class Lesson < ActiveRecord::Base
  has_many :students
  belongs_to :teacher
  belongs_to :subject
  has_many :faults
  accepts_nested_attributes_for :subject
  accepts_nested_attributes_for :teacher
end
