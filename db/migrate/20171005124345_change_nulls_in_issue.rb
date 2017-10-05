class ChangeNullsInIssue < ActiveRecord::Migration[5.1]
  def change
    change_column_null :issues, :description, false
    change_column_null :issues, :hostel_id, false
    change_column_null :issues, :room, false
    change_column_null :issues, :status, false
  end
end
