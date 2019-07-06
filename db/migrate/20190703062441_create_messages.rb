class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string     :body
      t.references  :sender, references: :users, index: true
      t.references :receiver, references: :users, index: true
      t.timestamps
    end
  end
end
