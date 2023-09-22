# Tea to You

This is a RESTful API service for a tea subscription application. In this MVP, there are three endpoints exposed, one to subscribe a customer to a new tea subscription, one to cancel a subscription, and one to get all of a customer's subscriptions. This project was completed as a "take home" practice project as part of the Mod 4 curriculum at Turing School of Software and Design. 

---

### Tech Stack
Ruby, Rails, ActiveRecord, PostgreSQL, SimpleCov, RSpec
<div align="left">  
    <a href="https://www.postgresql.org/" target="_blank"><img style="margin: 10px" src="https://profilinator.rishav.dev/skills-assets/postgresql-original-wordmark.svg" alt="PostgreSQL" height="50" /></a>  
    <a href="https://rubyonrails.org/" target="_blank"><img style="margin: 10px" src="https://profilinator.rishav.dev/skills-assets/rails-original-wordmark.svg" alt="Rails" height="50" /></a>  
    <a href="https://www.ruby-lang.org/en/" target="_blank"><img style="margin: 10px" src="https://profilinator.rishav.dev/skills-assets/ruby-original-wordmark.svg" alt="CSS3" height="50" /></a>   
</div>

--- 
### Usage

To Setup Install:
- Ruby 3.2.2
- Rails 7.0.7
- Fork and clone

Then run:
- `bundle install`
- `rails db:{create,migrate,seed}`



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

PATCH '/api/v1/subscriptions/id'

*(The id in the route above is the subscription id)*

JSON Body:
```
{
  "customer_id":"integer",
  "status":"cancelled"
}
```
Example response:
```
{
    "data": {
        "id": "27",
        "type": "subscription",
        "attributes": {
            "customer_id": 115,
            "title": "Grandma's Tea",
            "price": 17.0,
            "status": "cancelled",
            "frequency": "monthly",
            "teas": [
                {
                    "tea_id": 14
                },
                {
                    "tea_id": 8
                }
            ]
        }
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