class CreateStudents < ActiveRecord::Migration[4.2]

  def change
  	create_table :students do |t|
      t.references :classroom, index: true, foreign_key: true
      t.string :name
      t.string :address
      t.string :phone_no
      t.string :gender
      t.timestamps
    end
  end

end
