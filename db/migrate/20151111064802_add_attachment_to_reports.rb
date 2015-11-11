class AddAttachmentToReports < ActiveRecord::Migration
  def up
    add_attachment :reports, :pdf
  end

  def down
    remove_attachment :reports, :pdf
  end
end
