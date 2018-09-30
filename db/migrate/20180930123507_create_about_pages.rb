class CreateAboutPages < ActiveRecord::Migration[5.2]
  def change
    create_table :about_pages do |t|
      t.string :title
      t.text :body
      t.string :meta_description

      t.timestamps
    end
  end
end
