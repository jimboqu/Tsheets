class AddLiveToBlocks < ActiveRecord::Migration
  def change
    add_column :blocks, :live, :boolean
  end
end
