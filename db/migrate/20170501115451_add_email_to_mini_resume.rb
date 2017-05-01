class AddEmailToMiniResume < ActiveRecord::Migration[5.0]
  def change
    add_column :mini_resumes, :email, :string
  end
end
