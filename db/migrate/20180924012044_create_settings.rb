class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :telephone
      t.string :contact_email
      t.string :office_address
      t.string :hourly_rate

      t.timestamps
    end
  end
end
