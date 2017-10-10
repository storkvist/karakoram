class AddPublicToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :public, :boolean, default: true
  end
end
