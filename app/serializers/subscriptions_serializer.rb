class SubscriptionsSerializer
  include JSONAPI::Serializer
  attributes :title, 
             :price,
             :status,
             :frequency
  attribute :teas do |object|
    object.teas.each do |tea|
      tea.title
    end
end
