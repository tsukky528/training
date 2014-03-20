class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :movie
      t.text :explain
      t.string :muscle

      t.timestamps
    end
  end
end
