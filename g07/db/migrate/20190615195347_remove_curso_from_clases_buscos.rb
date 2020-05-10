class RemoveCursoFromClasesBuscos < ActiveRecord::Migration[5.1]
  def change
    remove_column :clases_buscos, :curso, :string
  end
end
