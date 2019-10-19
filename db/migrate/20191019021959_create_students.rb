class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.bigint :cohort
      t.integer :age
    end
  end
end
