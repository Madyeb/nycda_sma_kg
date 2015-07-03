class AddPhotoToStudent < ActiveRecord::Migration
  def up
    add_attachment :students, :photo
  end

  def down
    remove_attachment :students, :photo
  end
end
