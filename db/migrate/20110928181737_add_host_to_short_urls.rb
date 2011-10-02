class AddHostToShortUrls < ActiveRecord::Migration
  def change
    add_column :short_urls, :host, :string
  end
end
