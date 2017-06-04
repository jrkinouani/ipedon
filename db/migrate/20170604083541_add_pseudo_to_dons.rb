class AddPseudoToDons < ActiveRecord::Migration[5.0]
  def change
    add_column :dons, :pseudo, :string
  end
end
