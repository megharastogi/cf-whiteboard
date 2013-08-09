require 'spec_helper'

describe Question do
	it "should give an error if title is blank" do
    question = Question.create(:title => "")
    question.should_not be_valid
    question.errors[:title].include?("can't be blank")
  end

  it "should give an error if username is blank" do
    question = Question.create(:title => "some title" , :user_name => "")
    question.should_not be_valid
    question.errors[:user_name].include?("can't be blank")
  end

  it "should give an error if company is blank" do
    question = Question.create(:title => "some content" , :user_name => "test_user", :company => nil)
    question.should_not be_valid
    question.errors[:company].include?("can't be blank")
  end

  it "should let user create question if title,username and company is present" do
  	question = Question.create(:title => "some content" , :user_name => "test_user", :company => "abcd")
    question.should be_valid 
  end

end
