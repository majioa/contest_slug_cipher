class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :text
      t.integer :digit
      t.belongs_to :user, index: true

      t.timestamps
    end
  end
end
