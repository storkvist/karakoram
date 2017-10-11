class RemoveIconFromTags < ActiveRecord::Migration[5.1]
  def change
    remove_column :tags, :icon
  end
end
