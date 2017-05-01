class CreateMiniResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :mini_resumes do |t|
      t.string :name
      t.string :job_name
      t.integer :sex
      t.string :birthday
      t.string :work_start_time
      t.integer :state
      t.string :address
      t.integer :wage_upper_bound
      t.integer :wage_lower_bound
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
