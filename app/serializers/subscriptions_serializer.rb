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
    object.tea_list
  end
end
