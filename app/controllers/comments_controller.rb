class CommentsController < ApplicationController
	
	def create_comment
		@question = Question.find_by_id(params[:question_id])
		@comment = Comment.new(:content => params[:content],:user_name => params[:user_name],:question_id => @question.id)
		if @comment.save
			redirect_to question_path(@question.id)
		else
			render :template => "questions/show"
		end
	end

end


