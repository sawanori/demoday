class AddPostImageToPostarticles < ActiveRecord::Migration
  def change
    add_column :postarticles, :post_image, :string
  end
end
