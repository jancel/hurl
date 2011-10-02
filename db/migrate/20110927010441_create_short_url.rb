class CreateShortUrl < ActiveRecord::Migration
  def change
    create_table :short_urls do |t|
      t.text      :long_url
      t.string    :url_hash
      t.boolean   :private, :default => false
      t.boolean   :spam, :default => false
      t.boolean   :active, :default => true

      t.timestamps
    end
  end
end
