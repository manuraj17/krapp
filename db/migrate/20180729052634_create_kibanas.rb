class CreateKibanas < ActiveRecord::Migration[5.1]
  def change
    create_table :kibanas do |t|
      t.text :url

      t.timestamps
    end
  end
end
