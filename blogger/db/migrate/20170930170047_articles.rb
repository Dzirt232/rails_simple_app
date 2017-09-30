class Articles < ActiveRecord::Migration
  def change
  	remove_column :articles, :views_counter, :string
  end
end
