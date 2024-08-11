require 'net/http'
require 'uri'

module BioImageHelper

  def bioimage_helper(member)
    img_url = "https://image.tmdb.org/t/p/original/#{member}"
    res = Net::HTTP.get_response(URI.parse(img_url.to_s))

    res.is_a?(Net::HTTPSuccess) ? img_url : 'https://unsplash.com/fr/photos/turned-on-projector-J39X2xX_8CQ'
  end

end
