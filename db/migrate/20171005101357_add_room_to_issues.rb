class AddRoomToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :room, :string
  end
end
