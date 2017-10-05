class CreateHostels < ActiveRecord::Migration[5.1]
  def change
    create_table :hostels do |t|
      t.string :name

      t.timestamps
    end
  end
end
