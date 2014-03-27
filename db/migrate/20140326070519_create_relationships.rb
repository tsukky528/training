class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :user_id
      t.integer :like_movie_id

      t.timestamps
    end
      add_index :relationships, :user_id
      add_index :relationships, :like_movie_id
      add_index :relationships, [:user_id, :like_movie_id], unique: true
  end
end
