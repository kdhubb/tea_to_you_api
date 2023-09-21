# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


TeaSubscription.destroy_all
Subscription.destroy_all
Tea.destroy_all
Customer.destroy_all

customer_1 = Customer.create!(first_name: "Wolfie", last_name: "Von Wiggles", email: "wolfie@email.com", address: "address")
customer_2 = Customer.create!(first_name: "Maggie", last_name: "Carothers", email: "mags@email.com", address: "address")
customer_3 = Customer.create!(first_name: "Circe", last_name: "Carothers", email: "circe@email.com", address: "address")
customer_4 = Customer.create!(first_name: "Taro", last_name: "Boba", email: "taroboba@email.com", address: "address")
customer_5 = Customer.create!(first_name: "Mr. Jelly", last_name: "Jelly", email: "mrjelly@email.com", address: "address")

sub_1 = customer_1.subscriptions.create!(title: "Best Tea Ever", price: 20.0, frequency: "monthly")
sub_2 = customer_1.subscriptions.create!(title: "Tea for Mom", price: 18.0, frequency: "monthly")
sub_3 = customer_2.subscriptions.create!(title: "Green Tea Rocks", price: 15.50, frequency: "every other month")
sub_4 = customer_3.subscriptions.create!(title: "Always Seeping", price: 13.00, frequency: "every other week")
sub_5 = customer_4.subscriptions.create!(title: "Mixer", price: 25.50, frequency: "monthly")
sub_6 = customer_5.subscriptions.create!(title: "All the Tea", price: 30.0, frequency: "every three months")
sub_7 = customer_5.subscriptions.create!(title: "Mr. Tea", price: 23.00, frequency: "weekly")
sub_8 = customer_5.subscriptions.create!(title: "Ice Tea", price: 27.0, frequency: "monthly")
sub_9 = customer_5.subscriptions.create!(title: "Grandma's Tea", price: 17.00, frequency: "monthly")

tea_1 = Tea.create!(title: "Rose Green", description: "Delicate floral", temperature: 130, brew_time: 4.0)
tea_2 = Tea.create!(title: "Green Jasmine", description: "Classic floral", temperature: 130, brew_time: 3.5)
tea_3 = Tea.create!(title: "Sencha", description: "Woody green", temperature: 130, brew_time: 4.0)
tea_4 = Tea.create!(title: "Australian Breakfast", description: "Wake up black tea", temperature: 200, brew_time: 4.0)
tea_5 = Tea.create!(title: "Earl Grey", description: "Floral intense black tea", temperature: 200, brew_time: 5.0)
tea_6 = Tea.create!(title: "Barry's", description: "Wake up", temperature: 200, brew_time: 3.0)
tea_7 = Tea.create!(title: "Rooibos Chai", description: "Relaxing dessert tea", temperature: 150, brew_time: 5.0)

TeaSubscription.create!(subscription: sub_1, tea: tea_1)
TeaSubscription.create!(subscription: sub_1, tea: tea_2)
TeaSubscription.create!(subscription: sub_1, tea: tea_5)
TeaSubscription.create!(subscription: sub_2, tea: tea_1)
TeaSubscription.create!(subscription: sub_2, tea: tea_3)
TeaSubscription.create!(subscription: sub_2, tea: tea_7)
TeaSubscription.create!(subscription: sub_3, tea: tea_1)
TeaSubscription.create!(subscription: sub_3, tea: tea_2)
TeaSubscription.create!(subscription: sub_3, tea: tea_3)
TeaSubscription.create!(subscription: sub_4, tea: tea_7)
TeaSubscription.create!(subscription: sub_4, tea: tea_6)
TeaSubscription.create!(subscription: sub_4, tea: tea_5)
TeaSubscription.create!(subscription: sub_5, tea: tea_4)
TeaSubscription.create!(subscription: sub_5, tea: tea_7)
TeaSubscription.create!(subscription: sub_5, tea: tea_2)
TeaSubscription.create!(subscription: sub_5, tea: tea_1)
TeaSubscription.create!(subscription: sub_6, tea: tea_1)
TeaSubscription.create!(subscription: sub_6, tea: tea_2)
TeaSubscription.create!(subscription: sub_6, tea: tea_3)
TeaSubscription.create!(subscription: sub_6, tea: tea_4)
TeaSubscription.create!(subscription: sub_6, tea: tea_5)
TeaSubscription.create!(subscription: sub_6, tea: tea_6)
TeaSubscription.create!(subscription: sub_6, tea: tea_7)
TeaSubscription.create!(subscription: sub_7, tea: tea_6)
TeaSubscription.create!(subscription: sub_8, tea: tea_6)
TeaSubscription.create!(subscription: sub_8, tea: tea_4)
TeaSubscription.create!(subscription: sub_9, tea: tea_7)
TeaSubscription.create!(subscription: sub_9, tea: tea_1)

