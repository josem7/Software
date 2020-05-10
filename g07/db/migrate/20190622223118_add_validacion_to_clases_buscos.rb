class AddValidacionToClasesBuscos < ActiveRecord::Migration[5.1]
  def change
    add_column :clases_buscos, :validacion, :boolean, :default => true
  end
end
