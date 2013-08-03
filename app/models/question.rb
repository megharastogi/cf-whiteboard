class Question < ActiveRecord::Base
	has_many :comments
	validates_presence_of :title, :user_name, :company
	accepts_nested_attributes_for :comments
	
	attr_accessible :title, :user_name, :company, :job_title

end
