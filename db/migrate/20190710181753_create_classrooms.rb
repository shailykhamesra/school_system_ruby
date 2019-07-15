class CreateClassrooms < ActiveRecord::Migration[4.2]

  def change
    create_table :classrooms do |t|
      t.references :school, index: true, foreign_key: true
      t.integer :room_no
      t.integer :class_no
      t.timestamps
    end
  end

end
