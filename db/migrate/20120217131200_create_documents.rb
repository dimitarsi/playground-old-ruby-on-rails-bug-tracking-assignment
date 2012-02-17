class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.string :url
      t.references :user

      t.timestamps
    end
    add_index :documents, :user_id
  end
end
