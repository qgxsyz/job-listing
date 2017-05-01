class AddMoreInformationToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :location, :string
    add_column :jobs, :education, :string
    add_column :jobs, :exprience, :string
  end
end
