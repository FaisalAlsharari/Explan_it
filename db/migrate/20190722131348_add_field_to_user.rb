class AddFieldToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :is_tutor, :boolean
    add_column :users, :university_name, :string
  end
end
