class CreateComments < ActiveRecord::Migration[5.0]

  # This is used to create a Comment model
  def change
    create_table :comments do |t|
      # these are the references to user and post models
      t.references :user, foreign_key: true
      t.references :post, foreign_key: true
      # this is the unique addition for this model
      t.text :content

      t.timestamps
      # they are all columns, there are 4 in total.
    end
  end
end
