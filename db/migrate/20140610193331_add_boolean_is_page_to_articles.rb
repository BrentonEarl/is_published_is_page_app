class AddBooleanIsPageToArticles < ActiveRecord::Migration
  def change
  	add_column :articles, :is_page, :boolean, default: false
  end
end
