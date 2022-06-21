# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
users = User.create!([
  {
    name: 'Soufiane',
    email: 'soufiane@proton.com',
    password: '123123'
  },
  {
    name: 'Mwafrika',
    email: 'mwafrika@proton.com',
    password: '123123'
  },
])

recipes = Recipe.create!([
  {
    name: 'Recipe 1',
    preparation_time: 25,
    cooking_time: 10,
    public: false,
    description: 'Description for recipe 1',
    user: users.first
  },
  {
    name: 'Recipe 2',
    preparation_time: 25,
    cooking_time: 30,
    public: true,
    description: 'Description for recipe 2',
    user: users.first
  },
  {
    name: 'Recipe 3',
    preparation_time: 50,
    cooking_time: 120,
    public: true,
    description: 'Description for recipe 3',
    user: users.last
  },
])

foods = Food.create!([
  {
    name: 'Food 1',
    measurement_unit: 'gram',
    price: 3.2,
    user: users.first,
  },
  {
    name: 'Food 2',
    measurement_unit: 'liter',
    price: 5,
    user: users.first
  },
  {
    name: 'Food 3',
    measurement_unit: 'tsp',
    price: 0.2,
    user: users.second
  },
])

inventories = Inventory.create!([
  {
    name: 'Inventory 1',
    user: users.first,
  },
  {
    name: 'Inventory 2',

    user: users.second
  },
  {
    name: 'Inventory 3',
    user: users.second
  },
])

recipe_foods = RecipeFood.create!([
  {
    quantity: 1,
    food: foods.first,
    recipe: recipes.first
  },
  {
    quantity: 1.5,
    food: foods.second,
    recipe: recipes.first
  },
  {
    quantity: 5,
    food: foods.third,
    recipe: recipes.second
  },
])

inventory_foods = InventoryFood.create!([
  {
    quantity: 1,
    food: foods.first,
    inventory: inventories.first
  },
  {
    quantity: 1.5,
    food: foods.second,
    inventory: inventories.second
  },
  {
    quantity: 5,
    food: foods.third,
    inventory: inventories.second
  },
])


