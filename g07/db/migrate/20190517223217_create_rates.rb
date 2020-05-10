class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.integer :uid
      t.integer :rid
      t.float :disp
      t.float :enchufe
      t.float :ruido

      t.timestamps
    end
  end
end
