class AddImgToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :img, :string
  end
end
