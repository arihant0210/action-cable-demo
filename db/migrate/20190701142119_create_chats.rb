class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.string :topic
      t.string :slug
      t.timestamps
    end
  end
end
