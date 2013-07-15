class UserDecorator < ApplicationDecorator
  decorates_finders
  delegate_all

  def gravatar(options = { size: 50 })
    gravatar_id = Digest::MD5.hexdigest(object.email.downcase)
    size = options[:size]
    gravatar_url =
      "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    h.image_tag(gravatar_url, alt: object.name, class: 'gravatar')
  end
end
