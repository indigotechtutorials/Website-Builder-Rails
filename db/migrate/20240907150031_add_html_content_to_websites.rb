class AddHtmlContentToWebsites < ActiveRecord::Migration[7.1]
  def change
    add_column :websites, :html_content, :text
  end
end
