class CreateTwitmodels < ActiveRecord::Migration
  def change
    create_table :twitmodels do |t|
      t.text :content
      t.timestamps null: false
    end
  end
end
