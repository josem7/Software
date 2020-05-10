class AddValidacionToClasesOfrezcos < ActiveRecord::Migration[5.1]
  def change
    add_column :clases_ofrezcos, :validacion, :boolean, :default => true
  end
end
