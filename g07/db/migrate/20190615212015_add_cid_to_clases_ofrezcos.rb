class AddCidToClasesOfrezcos < ActiveRecord::Migration[5.1]
  def change
    add_column :clases_ofrezcos, :cid, :integer
  end
end
