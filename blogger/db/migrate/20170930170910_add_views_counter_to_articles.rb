class AddViewsCounterToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :views_counter, :integer
  end
end
