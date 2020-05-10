class CreateJoinClasesOfrezcos < ActiveRecord::Migration[5.1]
  def change
    create_table :join_clases_ofrezcos do |t|

      t.timestamps
    end
  end
end
