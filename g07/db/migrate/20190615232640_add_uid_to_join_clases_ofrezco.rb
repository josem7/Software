class AddUidToJoinClasesOfrezco < ActiveRecord::Migration[5.1]
  def change
    add_column :join_clases_ofrezcos, :uid, :integer
  end
end
