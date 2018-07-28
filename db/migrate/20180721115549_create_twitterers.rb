class CreateTwitterers < ActiveRecord::Migration[5.0]
  def change
    create_table :twitterers do |t|
      t.string :provider
      t.string :uid
      t.string :user_name
      t.string :image_url

      t.timestamps
    end
  end
end
