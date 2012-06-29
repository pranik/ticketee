# This migration comes from forem (originally 20120627152450)
class AddPostsCountToForemTopics < ActiveRecord::Migration
  def change
    add_column :forem_topics, :posts_count, :integer, :default => 0
  end
end
