class CreateTeachers < ActiveRecord::Migration[4.2]

  def change
  	create_table :teachers do |t|
      t.references :school, index: true, foreign_key: true
      t.string :name
      t.string :address
      t.string :phone_no
      t.string :gender
      t.timestamps
    end
  end

end
