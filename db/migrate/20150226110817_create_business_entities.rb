class CreateBusinessEntities < ActiveRecord::Migration
  def change
    create_table :business_entities do |t|
      t.string :name
      t.string :name_short

      t.timestamps
    end
  end
end
