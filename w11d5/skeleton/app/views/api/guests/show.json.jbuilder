json.partial! 'api/guests/guest', guest: @guest

json.set! "gifts" do
    json.extract! @gift, :title, :description
end
