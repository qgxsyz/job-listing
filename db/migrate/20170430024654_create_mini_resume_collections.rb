class CreateMiniResumeCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :mini_resume_collections do |t|
      t.integer :user_id
      t.integer :mini_resume_id

      t.timestamps
    end
  end
end
