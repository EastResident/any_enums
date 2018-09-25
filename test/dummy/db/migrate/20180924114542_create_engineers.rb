class CreateEngineers < ActiveRecord::Migration[5.2]
  def change
    create_table :engineers do |t|
      t.integer :field

      t.timestamps
    end
  end
end
