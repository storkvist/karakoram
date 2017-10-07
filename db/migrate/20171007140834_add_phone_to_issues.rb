class AddPhoneToIssues < ActiveRecord::Migration[5.1]
  def change
    add_column :issues, :phone, :string
  end
end
