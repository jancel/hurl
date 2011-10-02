class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.string :host
      t.string :host_with_port
      t.string :referrer
      t.string :path
      t.string :url_hash
      t.string :ip_address
      t.string :user_agent
      t.string :language
      t.boolean :processed

      t.timestamps
    end
  end
end
