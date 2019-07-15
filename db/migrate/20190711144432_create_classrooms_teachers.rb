class CreateClassroomsTeachers < ActiveRecord::Migration[4.2]

  def change
  	create_table :classrooms_teachers, id: false do |t|
      t.references :classroom, index: true, foreign_key: true
      t.references :teacher, index: true, foreign_key: true
    end
  end

end
