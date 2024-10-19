class CreateCourses < ActiveRecord::Migration[7.2]
  def change
    create_table :courses, id: :uuid do |t|
      t.string  :title,       null: false
      t.string  :image,       null: false
      t.text    :description, null: false
      t.date    :end_date,    null: false

      t.timestamps
    end
  end
end
