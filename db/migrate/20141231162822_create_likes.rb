class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :userA_id
      t.integer :userB_id
      t.timestamps
    end
  end
end
