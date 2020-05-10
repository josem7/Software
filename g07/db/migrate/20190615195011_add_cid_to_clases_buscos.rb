class AddCidToClasesBuscos < ActiveRecord::Migration[5.1]
  def change
    add_column :clases_buscos, :cid, :integer
  end
end
