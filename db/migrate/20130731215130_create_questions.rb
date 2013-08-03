class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
   	  t.text :title
   	  t.string :user_name
   	  t.string :company
   	  t.string :job_title
      t.timestamps
    end
  end
end
