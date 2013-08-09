require 'spec_helper'

describe CommentsController do
	before(:all) do
    Comment.delete_all
  end

  it "not let user create invalid comment for an existing question" do
  	@question = Question.create(:title =>"some title",:user_name => "user",:company => "abcd")
  	post :create_comment ,:question_id => @question.id,:content =>""
  	@question.comments.size == 0
 	end

 	it " let user create comment for an existing question" do
  	@question = Question.create(:title =>"some title",:user_name => "user",:company => "abcd")
  	post :create_comment ,:question_id => @question.id, :content =>"some content",:user_name => "user_name",:company => "abcd"
  	@question.comments.size == 1
  	response.should redirect_to(question_path(@question))
 	end

end
