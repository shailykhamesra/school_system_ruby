class CreateSchools < ActiveRecord::Migration[4.2]

  def change
  	create_table :schools do |t|
      t.string :name
      t.string :address
      t.string :phone_no
      t.string :code
      t.timestamps
    end
  end

end
