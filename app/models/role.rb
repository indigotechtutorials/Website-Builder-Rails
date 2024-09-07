class Role < ApplicationRecord
  class << self
    def admin_role
      where(name: "admin").first
    end
  end
end
