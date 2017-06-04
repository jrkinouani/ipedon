class CreateDons < ActiveRecord::Migration[5.0]
  def change
    create_table :dons do |t|
      t.string :price

      t.timestamps
    end
  end
end
