class AddTeaserImageIdToRefineryNewsItems < ActiveRecord::Migration
  def change
    add_column :refinery_news_items, :teaser_image_id, :integer
  end
end
