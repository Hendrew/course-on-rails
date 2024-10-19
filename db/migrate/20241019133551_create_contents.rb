class CreateContents < ActiveRecord::Migration[7.2]
  def change
    create_table :contents, id: :uuid do |t|
      t.string      :title,   null: false
      t.string      :video,   null: false
      t.integer     :size,    null: false
      t.references  :course,  null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
