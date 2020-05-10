class AddEidToJoinClasesBusco < ActiveRecord::Migration[5.1]
  def change
    add_column :join_clases_buscos, :eid, :integer
  end
end
