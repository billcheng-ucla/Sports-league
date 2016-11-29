class CreateLeagues < ActiveRecord::Migration[5.0]
  def change
    create_table :leagues do |t|
      t.string :league_name
      t.string :sport
      t.belongs_to :user, uniqueness: true, foreign_key: true

      t.timestamps
    end
  end
end
