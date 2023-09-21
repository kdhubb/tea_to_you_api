## JSON Contract 

Subscribe a customer to a tea subscription

POST '/api/v1/subscriptions'
JSON Body: 
```
{
  "customer_id":"integer",
  "title":"string",
  "price":"float",
  "frequency":"string" 
}
```
Example response: 
```
{
  "data": {
    "id":"integer",
    "type":"subscription",
    "attributes": {
      "customer_id":"integer",
      "title":"string",
      "price":"float",
      "status":"active",
      "frequency":"string"
      "teas": [
        "title":"string",
        "title":"string",
        "title":"string"
      ]
    }
  }
}
```

--
Cancel a customer's tea subscription

PATCH '/api/v1/subscriptions'
JSON Body:
```
{
  "subscription_id":"integer",
  "customer_id":"integer",
  "status":"inactive"
}
```
Example response:
```
{
  "data": {
    "subscription_id":"integer",
    "customer_id":"integer",
    "status":"inactive"
  }
}
```