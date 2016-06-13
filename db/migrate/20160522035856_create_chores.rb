class CreateChores < ActiveRecord::Migration
  def change
    create_table :chores do |t|
      t.string :chore_name
      t.string :description
      t.string :user_to_complete

      t.timestamps null: false
    end
  end
end
