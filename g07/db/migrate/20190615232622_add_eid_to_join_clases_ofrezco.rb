class AddEidToJoinClasesOfrezco < ActiveRecord::Migration[5.1]
  def change
    add_column :join_clases_ofrezcos, :eid, :integer
  end
end
