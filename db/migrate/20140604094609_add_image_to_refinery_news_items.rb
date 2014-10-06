class AddImageToRefineryNewsItems < ActiveRecord::Migration
  def change
    add_column :refinery_news_items, :teaser_image, :string
  end
end
