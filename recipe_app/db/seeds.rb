# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#r = Recipe.new(:title => "aaa", :description => "dd", :user_id =>  1 )
#r.ingredients.build(name: "ss")
#r.ingredients.build(name: "a")
#r.steps.build(step: "step")
#r.save
#u = User.new(:email => "sasha@gmail.com", :password => "111111", :password_confirmation => "111111", :name => "Sasha")
u = User.new(:email => "ayesha@gmail.com", :password => "111111", :password_confirmation => "111111", :name => "Ayesha Ansari")
u.save
r = Recipe.new(:title => "Peanut Butter Fudge", :description => " This is the easiest peanut butter fudge ever, and it is so good.", :user_id =>  1 )
r.ingredients.build(name: "White Almond Bark")
r.ingredients.build(name: "Peanut Butter")
r.steps.build(step: "Line an 8x8-inch baking dish with plastic wrap long enough to overhang the dish by several inches on each side.")
r.steps.build(step: "Place broken coating into a large glass microwave-safe bowl and melt on low power in microwave oven, about 5 minutes, stirring after every 30 seconds to 1 minute. When coating is smooth and creamy, stir peanut butter into coating until fudge is thoroughly combined. Spread fudge into the prepared baking dish.")
r.save


r = Recipe.new(:title => "Ice Cream Muffins", :description => "It's an e-z recipe, just 2 ingredients and so delicious. It's been in my
family since 1955. Use vanilla ice cream or any flavor you prefer.", :user_id =>  1 )
r.ingredients.build(name: "2 cups self rising flour")
r.ingredients.build(name: "1 pint vanilla ice cream, softened ")
r.steps.build(step: "Preheat an oven to 425 degrees F (220 degrees C). Grease 12 muffin cups, or line with paper muffin liners.")
r.steps.build(step: "Mix self-rising flour and vanilla ice cream together until smooth. Spoon batter in muffin cups, filling them 3/4 full.")
r.steps.build(step: "Bake in the preheated oven until a toothpick inserted into the center of a muffin comes out clean, about 20 to 25 minutes. Cool in the pans for 10 minutes before removing to cool completely on a wire rack.")
r.save



u = User.new(:email => "sasha@gmail.com", :password => "111111", :password_confirmation => "111111", :name => "Sasha Cooper")
u.save
