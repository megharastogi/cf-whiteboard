FactoryGirl.define do
  factory :valid_comment do
  	id '1'
  	content 'some content'
  	user_name 'user_name'
  	question_id '1'
  end

  factory :invalid_comment do
  	id '1'
  	content 'some content'
  	user_name ''
  	question_id ''
  end
end