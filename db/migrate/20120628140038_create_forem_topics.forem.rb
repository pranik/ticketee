# This migration comes from forem (originally 20120627133228)
class CreateForemTopics < ActiveRecord::Migration
  def change
    create_table :forem_topics do |t|
      t.text :subject
      t.integer :user_id

      t.timestamps
    end
  end
end
