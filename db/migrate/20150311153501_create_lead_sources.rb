class CreateLeadSources < ActiveRecord::Migration
  def change
    create_table :lead_sources do |t|
      t.string :name
      t.references :lead_source_group_id

      t.timestamps
    end
  end
end
