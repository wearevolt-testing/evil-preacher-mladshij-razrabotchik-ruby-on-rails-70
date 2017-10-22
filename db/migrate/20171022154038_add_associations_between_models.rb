class AddAssociationsBetweenModels < ActiveRecord::Migration[5.1]
  def change
    add_reference :posts, :author
    add_reference :comments, :post
    add_reference :comments, :author
  end
end
