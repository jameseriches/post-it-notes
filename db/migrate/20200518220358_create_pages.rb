class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :subject
      t.string :author
      t.text :note

      t.timestamps
    end
  end
end
