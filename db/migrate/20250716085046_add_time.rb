class AddTime < ActiveRecord::Migration[8.0]
  def change
    unless column_exists?(:articles, :created_at)
      add_column :articles, :created_at, :datetime
    end
    unless column_exists?(:articles, :updated_at)
      add_column :articles, :updated_at, :datetime
    end
  end
end