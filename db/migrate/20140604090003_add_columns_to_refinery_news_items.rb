class AddColumnsToRefineryNewsItems < ActiveRecord::Migration
  def change
    add_column :refinery_news_items, :teaser, :text
    add_column :refinery_news_items, :main_image, :image
  end
end
