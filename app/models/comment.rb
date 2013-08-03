class Comment < ActiveRecord::Base
	belongs_to :question 
	validates_presence_of :content, :user_name, :question_id

	attr_accessible :content, :user_name, :question_id 

end
