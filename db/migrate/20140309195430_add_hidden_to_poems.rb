class AddHiddenToPoems < ActiveRecord::Migration
  def change
    add_column :poems, :hidden, :boolean, default: false, null: false
  end
end
