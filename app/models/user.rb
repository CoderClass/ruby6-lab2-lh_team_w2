class User < ApplicationRecord
  has_secure_password

  def image_url_or_default
    image_url.presence || "http://loremflickr.com/72/72/#{name.strip}"
  end
end
