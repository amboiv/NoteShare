class CreateEducationPrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :education_programs do |t|
      t.string :title

      t.timestamps
    end
  end
end
