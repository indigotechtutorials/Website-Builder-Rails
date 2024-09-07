class Website < ApplicationRecord
  extend FriendlyId
  friendly_id :parsed_name, use: :slugged
  belongs_to :user

  def parsed_name
    # app.mycreation.ai
    pieces = name.split(".")
    if pieces.size > 2
      pieces[0..-1].join("")
    else
      pieces[0]
    end
  end
end
