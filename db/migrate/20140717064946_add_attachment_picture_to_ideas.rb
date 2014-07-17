class AddAttachmentPictureToIdeas < ActiveRecord::Migration
  def self.up
    change_table :ideas do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :ideas, :picture
  end
end
