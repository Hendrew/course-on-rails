class CreateContents < ActiveRecord::Migration[7.2]
  def change
    create_table :contents, id: :uuid do |t|
      t.string      :title,   null: false
      t.string      :video,   null: false
      t.integer     :video_size
      t.references  :course,  null: false, foreign_key: true, type: :uuid

      t.timestamps
    end

    add_index :contents, [:title, :course_id], unique: true, name: "index_contents_on_title_and_course_id"
  end
end
