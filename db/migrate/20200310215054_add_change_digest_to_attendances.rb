class AddChangeDigestToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column :attendances, :change_digest, :string
  end
end
