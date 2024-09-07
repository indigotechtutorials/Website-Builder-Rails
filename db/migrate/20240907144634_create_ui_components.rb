class CreateUiComponents < ActiveRecord::Migration[7.1]
  def change
    create_table :ui_components do |t|
      t.string :name
      t.text :html_content

      t.timestamps
    end
  end
end
