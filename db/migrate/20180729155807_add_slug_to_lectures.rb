class AddSlugToLectures < ActiveRecord::Migration[5.2]
  def change
    add_column :lectures, :slug, :string
    add_index :lectures, :slug, unique: true
  end
end
