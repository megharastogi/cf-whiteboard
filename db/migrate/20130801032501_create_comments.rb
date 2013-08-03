class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
   	  t.text :content
   	  t.string :user_name
   	  t.integer :question_id
      t.timestamps
    end
  end
end
