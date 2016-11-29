class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.date :date
      t.string :description
      t.belongs_to :team, foreign_key: true
      t.timestamps
    end
  end
end
