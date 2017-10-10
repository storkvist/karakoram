class RenameHostelToBuilding < ActiveRecord::Migration[5.1]
  def change
    rename_table :hostels, :buildings
    rename_column :issues, :hostel_id, :building_id
  end
end
