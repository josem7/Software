class CreateJoinClasesBuscos < ActiveRecord::Migration[5.1]
  def change
    create_table :join_clases_buscos do |t|

      t.timestamps
    end
  end
end
