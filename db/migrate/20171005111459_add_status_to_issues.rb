class AddStatusToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :status, :integer, default: 1
  end
end
