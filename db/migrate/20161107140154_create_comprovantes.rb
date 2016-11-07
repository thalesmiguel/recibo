class CreateComprovantes < ActiveRecord::Migration[5.0]
  def change
    create_table :comprovantes do |t|
      t.string :nome
      t.text :descricao
      t.string :cidade
      t.date :data
      t.string :assinatura
      t.string :cpf
      t.string :rg
      t.decimal :valor
      t.references :imagem, foreign_key: true

      t.timestamps
    end
  end
end
