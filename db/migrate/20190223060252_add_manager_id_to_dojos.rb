class AddManagerIdToDojos < ActiveRecord::Migration[5.2]
  def change
    add_column :dojos, :manager_id, :integer
  end
end
