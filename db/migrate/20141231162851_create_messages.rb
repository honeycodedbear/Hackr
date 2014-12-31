class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :data
      t.integer :userA_id
      t.integer :userB_id
      t.timestamps
    end
  end
end
