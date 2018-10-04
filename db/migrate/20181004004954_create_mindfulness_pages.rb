class CreateMindfulnessPages < ActiveRecord::Migration[5.2]
  def change
    create_table :mindfulness_pages do |t|
      t.text :body
    end
  end
end
