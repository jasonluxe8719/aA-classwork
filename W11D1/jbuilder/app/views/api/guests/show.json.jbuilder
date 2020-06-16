json.partial! "api/guests/guests", guest: @guest
json.gifts do 
    json.array! @guest.gifts, :title, :description
end