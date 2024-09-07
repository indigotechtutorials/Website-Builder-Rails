require "fileutils"

class StoreTmpTailwindJob < ApplicationJob
  queue_as :default

  def perform(ui_component_id)
    ui_component = UiComponent.find(ui_component_id)
    FileUtils.mkdir_p Rails.root.join("tmp", "tailwind_classes")
    tmp_tailwind_path = Rails.root.join("tmp", "tailwind_classes", "tailwind_class_#{SecureRandom.uuid}.txt")
    File.open(tmp_tailwind_path, 'w') { |file| file.puts(ui_component.html_content) } 
  end
end
