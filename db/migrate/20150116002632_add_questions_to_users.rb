class AddQuestionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :q1, :string
    add_column :users, :q2, :string
    add_column :users, :q3, :string
    add_column :users, :creep_score, :float
  end
end
