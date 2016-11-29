class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :team_name
      t.string :picture
      t.string :symbol
      t.string :tag
      t.belongs_to :league, index: true, foreign_key: true
      t.belongs_to :manager, index: true
      t.timestamps
    end
  end
end
