class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.integer :interested_company_id
      t.string :lead_source
      t.string :status
      t.integer :contract_id

      t.timestamps
    end
  end
end
