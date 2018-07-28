class AddRatingsToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :ratings, :integer
  end
end
