class CreateImagems < ActiveRecord::Migration[5.0]
  def change
    create_table :imagens do |t|
      t.string :nome
      t.attachment :arquivo

      t.timestamps
    end
  end
end
