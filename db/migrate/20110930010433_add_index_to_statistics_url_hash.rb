class AddIndexToStatisticsUrlHash < ActiveRecord::Migration
  def change
    add_index :statistics, :url_hash
  end
end
