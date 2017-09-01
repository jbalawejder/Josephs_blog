class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.integer :voteable_id
      t.integer :voteable_type
      t.boolean :vote
      t.timestamps
    end
  end
end
