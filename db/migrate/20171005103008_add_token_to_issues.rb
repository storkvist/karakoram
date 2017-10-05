class AddTokenToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :token, :string
  end
end
