class ChangeCategoryToBeStringInSales < ActiveRecord::Migration[5.2]
  def change
    change_column :sales, :category, :string
  end
end
