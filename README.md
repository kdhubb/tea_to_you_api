## JSON Contract 

Subscribe a customer to a tea subscription

POST '/api/v1/subscriptions'
JSON Body: 
```
{
  "customer_id":"integer",
  "title":"string",
  "price":"float",
  "frequency":"string",
  "teas": [
    {
      "tea_id":"integer"
    },
    {
      "tea_id":"integer"
    }
  ] 
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
        {
          "tea_id":"integer"
        },
        {
          "tea_id":"integer"
        }
      ] 
    }
  }
}
```

---

Cancel a customer's tea subscription

PATCH '/api/v1/subscriptions'

JSON Body:
```
{
  "subscription_id":"integer",
  "customer_id":"integer",
  "status":"cancelled"
}
```
Example response:
```
{
  "data": {
    "subscription_id":"integer",
    "customer_id":"integer",
    "status":"cancelled"
  }
}
```
---

See all of a customer's subscriptions

GET '/api/v1/subscriptions'

JSON Body: 
```
{
  "customer_id":"integer"
}
```
Example response:
```
{
  "data":[
    {
      "id":"integer",
      "type":"subscription",
      "attributes": {
        "customer_id":"integer",
        "title":"string",
        "price":"float",
        "status":"active",
        "frequency":"string"
        "teas": [
          {
            "tea_id":"integer"
          },
          {
            "tea_id":"integer"
          }
        ] 
      }
    },
    {
      "id":"integer",
      "type":"subscription",
      "attributes": {
        "customer_id":"integer",
        "title":"string",
        "price":"float",
        "status":"active",
        "frequency":"string"
        "teas": [
          {
            "tea_id":"integer"
          },
          {
            "tea_id":"integer"
          }
        ] 
      }
    }
  ]
}
```