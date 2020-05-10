class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :likes, :type, :tipo
  end
end
