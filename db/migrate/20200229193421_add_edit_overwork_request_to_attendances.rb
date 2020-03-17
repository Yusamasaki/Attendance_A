class AddEditOverworkRequestToAttendances < ActiveRecord::Migration[5.1]
  def change
    add_column  :attendances, :expected_end_time, :datetime
    add_column  :attendances, :next_day, :string
    add_column  :attendances, :business_processing_contents, :string
    add_column  :attendances, :instructor_confirmation, :string
  end
end
