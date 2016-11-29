class AddAttachmentSymbolToTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.attachment :symbol
    end
  end

  def self.down
    remove_attachment :teams, :symbol
  end
end
