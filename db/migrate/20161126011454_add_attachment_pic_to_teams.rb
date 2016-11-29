class AddAttachmentPicToTeams < ActiveRecord::Migration
  def self.up
    change_table :teams do |t|
      t.attachment :pic
    end
  end

  def self.down
    remove_attachment :teams, :pic
  end
end
