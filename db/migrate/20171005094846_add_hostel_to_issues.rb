class AddHostelToIssues < ActiveRecord::Migration[5.1]
  def change
    add_reference :issues, :hostel, foreign_key: true
  end
end
