class CreateCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :courses, id: :uuid, default: 'gen_random_uuid()' do |t|
      t.references :subject, null: false, foreign_key: true, type: :uuid
      t.string :name
      t.string :module_code

      t.timestamps
    end
  end
end
