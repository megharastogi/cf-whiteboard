class QuestionsController < ApplicationController
	WillPaginate.per_page = 10

	def index
		@questions = Question.page(params[:page]).order("created_at DESC")
	end

	def show
		@question  = Question.find_by_id(params[:id])
	end

	def new
		@question = Question.new
		@comment = Comment.new
	end

	def edit
		@question = Question.find_by_id(params[:id])	
	end

	def create
		params_comment = params[:question].delete(:comment)
		@question = Question.new(params[:question])
		if @question.save 
			unless params_comment[:content].blank?
				@comment = @question.comments.build(:content => params_comment[:content], :user_name => params[:question][:user_name])
				@comment.save
			end
			redirect_to questions_path
		else
			render :action => "new"
		end
	end

	def update
		@question = Question.find_by_id(params[:id])
		if @question.update_attributes(params[:question]) 
			redirect_to questions_path
		else
			render :action => "edit"
		end
	end


end
