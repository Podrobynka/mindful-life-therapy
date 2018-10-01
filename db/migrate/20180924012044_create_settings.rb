class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :telephone
      t.string :contact_email
      t.string :office_address_line_1
      t.string :office_address_line_2
      t.string :office_address_line_3
      t.string :office_address_city
      t.string :office_address_postcode
      t.string :session_rate

      t.timestamps
    end
  end
end
