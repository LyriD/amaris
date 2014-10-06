class AddBigAvatarIdToRefineryPeople < ActiveRecord::Migration
  def change
    add_column :refinery_people, :big_avatar_id, :integer
  end
end
