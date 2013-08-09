require 'spec_helper'

describe Comment do
  it "should give an error if content is blank" do
    comment = Comment.create(:content => "")
    comment.should_not be_valid
    comment.errors[:content].include?("can't be blank")
  end

  it "should give an error if username is blank" do
    comment = Comment.create(:content => "some content" , :user_name => "")
    comment.should_not be_valid
    comment.errors[:user_name].include?("can't be blank")
  end

  it "should give an error if question_id is blank" do
    comment = Comment.create(:content => "some content" , :user_name => "test_user", :question_id => nil)
    comment.should_not be_valid
    comment.errors[:question_id].include?("can't be blank")
  end

  it "should let user create comment if content,username and question_id is present" do
  	comment = Comment.create(:content => "some content" , :user_name => "test_user", :question_id => 1)
    comment.should be_valid 
  end

end
