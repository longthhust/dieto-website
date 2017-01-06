class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :age, :integer
    add_column :users, :height, :float
    add_column :users, :weight, :float
    add_column :users, :gender, :string
  end
end
