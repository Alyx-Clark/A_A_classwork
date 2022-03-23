class CreateShortenedUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :shortened_urls do |t|
      t.integer :user_id, null: false 
      t.string :long_url, null: false
      t.string :short_url, 
      t.timestamps 
    end

    add_index :shortened_urls, :user_id, unique: true
    add_index :shortened_urls, :long_url, unique: true
    add_index :shortened_urls, :short_url, unique: true
  end
end
