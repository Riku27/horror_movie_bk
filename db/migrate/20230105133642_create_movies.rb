class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      
      t.string :title, null: false
      t.date :year, null: false
      t.string :director, null: false
      t.string :watch, null: false
      t.float :rate, null: false
      t.timestamps
    end
  end
end
