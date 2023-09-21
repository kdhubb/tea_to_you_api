class SubscriptionsSerializer
  include JSONAPI::Serializer
  attribute :customer_id do |object|
    object.customer.id
  end
  attributes :title, 
             :price,
             :status,
             :frequency
  attribute :teas do |object|
    object.teas.each do |tea|
      tea.id
    end
end
