# json.array!(@gifts) do |gift|
#   json.partial! 'api/gifts/gift', gift: gift
# end
@gifts.each do |gift|
  json.extract! gift, :title, :description
end