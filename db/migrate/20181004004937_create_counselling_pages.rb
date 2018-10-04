class CreateCounsellingPages < ActiveRecord::Migration[5.2]
  def change
    create_table :counselling_pages do |t|
      t.text :body
    end
  end
end
