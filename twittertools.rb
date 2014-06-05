# need to disable OpenSSL verification for local machine / Win 7
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
require 'twitter'

$twitter_client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "BnigFA98IcTCsMex99YUA"
  config.consumer_secret = "d911m2iqTbCc0ZjsPWElwHudS1OGC3ZAxtmdY0mVtwE"
end


def getprofileimage(username)
  user = $twitter_client.user(username)
  $profile_img = user.profile_image_url.to_s
rescue Twitter::Error::NotFound
  "default.jpg"
end

# profile_image_url: replace _hormal via gsub http://www.techotopia.com/index.php/Ruby_String_Replacement%2C_Substitution_and_Insertion