class CreateImpressions < ActiveRecord::Migration[5.0]
  def change
    create_table :impressions do |t|
      t.string :impression
      t.references :bushou, foreign_key: true

      t.timestamps
    end
  end
end
