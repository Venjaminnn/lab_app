class CreateLabReports < ActiveRecord::Migration[7.0]
  def change
    create_table :lab_reports do |t|
      t.references :user, foreign_key: true, index: true
      t.string :title, null: false, limit: 250
      t.string :description, limit: 500
      t.string :grade

      t.timestamps
    end
  end
end
