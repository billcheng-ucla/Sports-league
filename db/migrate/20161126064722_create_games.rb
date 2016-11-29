class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.date :date
      t.integer :home_score
      t.integer :guest_score
      t.belongs_to :home, index: true
      t.belongs_to :guest, index: true
      t.timestamps
    end
  end
end
