class AddTimesstampsToRecipe < ActiveRecord::Migration
  def change
     change_table :recipes do |t|
      t.timestamps
    end
  end
end

