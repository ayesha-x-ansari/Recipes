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



u = User.new(:email => "ayesha.x.ansari@gmail.com", :password => "123456", :password_confirmation => "123456", :name => "Ayesha Ansari")
u.save
u = User.new(:email => "sasha@gmail.com", :password => "123456", :password_confirmation => "123456", :name => "Sasha Cooper")
u.save
u = User.new(:email => "nancy@gmail.com", :password => "123456", :password_confirmation => "123456", :name => "Nancy Brown")
u.save
u = User.new(:email => "emma@gmail.com", :password => "123456", :password_confirmation => "123456", :name => "Emma Williams")
u.save
u = User.new(:email => "maria@gmail.com", :password => "123456", :password_confirmation => "123456", :name => "Maria Garcia")
u.save
u = User.new(:email => "amelia@gmail.com", :password => "123456", :password_confirmation => "123456", :name => "Amelia Jones")
u.save
r = Recipe.new(:title => "Peanut Butter Fudge", :description => " This is the easiest peanut butter fudge ever, and it is so good.", :user_id =>  1 )
r.ingredients.build(name: "White Almond Bark")
r.ingredients.build(name: "Peanut Butter")
r.steps.build(step: "Line an 8x8-inch baking dish with plastic wrap long enough to overhang the dish by several inches on each side.")
r.steps.build(step: "Place broken coating into a large glass microwave-safe bowl and melt on low power in microwave oven, about 5 minutes, stirring after every 30 seconds to 1 minute. When coating is smooth and creamy, stir peanut butter into coating until fudge is thoroughly combined. Spread fudge into the prepared baking dish.")
r.save



r = Recipe.new(:title => "Ice Cream Muffins", :description => "It's an e-z recipe, just 2 ingredients and so delicious. It's been in my family since 1955. Use vanilla ice cream or any flavor you prefer.",  :user_id =>  1 )
r.ingredients.build(name: "Rising flour")
r.ingredients.build(name: "Vanilla ice cream ")
r.steps.build(step: "2 cups self rising flour,  1 pint vanilla ice cream, softened ")
r.steps.build(step: "Preheat an oven to 425 degrees F (220 degrees C). Grease 12 muffin cups, or line with paper muffin liners.")
r.steps.build(step: "Mix self-rising flour and vanilla ice cream together until smooth. Spoon batter in muffin cups, filling them 3/4 full.")
r.steps.build(step: "Bake in the preheated oven until a toothpick inserted into the center of a muffin comes out clean, about 20 to 25 minutes. Cool in the pans for 10 minutes before removing to cool completely on a wire rack.")
r.save


r = Recipe.new(:title => "FAST NOT-FRIED RICE", :description => "Very delicious and healthy recipe", :user_id =>  1 )
r.ingredients.build(name: "Whole grain brown rice")
r.ingredients.build(:name => "Jalepeno")
r.ingredients.build(name: "Fresh parsley")
r.steps.build(step: " 2 large eggs,  1 cup whole grain brown rice, instant, 3 green onions, 1 handful fresh parsley, Salt and Pepper")
r.steps.build(step: " Bring a small pot of water to a boil. While you wait, put your raw eggs into a bowl of warm water to bring them to room temperature. Once the water in the pot is boiling add the eggs and cook for 10 minutes. ")
r.steps.build(step: "Peel the eggs and then grate them into little strips on a grater—using the largest holes. ")
r.steps.build(step: "Make the rice following the instructions on the package")
r.save



r = Recipe.new(:title =>"Vegan Fried Rice", :description => "Works great when you have a few things around the house that you need to use up. Only the rice, soy sauce, and sesame oil are mandatory", :user_id =>  1 )
r.ingredients.build(name: "Sesame oil")
r.ingredients.build(name: "Whole grain brown rice, instant")
r.ingredients.build(name:  "Green onions")
r.ingredients.build(name: "Red bell pepper diced")
r.steps.build(step: "1 teaspoon sesame oil,  1 cup whole grain brown rice, instant, 3 green onions, 1 red bell pepper diced, 2 large eggs, salt and pepper")
r.steps.build(step: "Heat olive oil in a large skillet over medium-high heat. ")
r.steps.build(step: " Add rice; cook and stir until heated through, 2 to 3 minutes. ")
r.steps.build(step: " Stir in soy sauce and sesame oil. Add onion, red bell pepper, mushrooms, and green onions; cook and stir until tender, 5 to 10 minutes.")
r.save




########################################################################################################
r = Recipe.new(:title => "Nutella Brownies", :description => "Sometimes all you need is some Nutella or chocolate. Well, now you can have both in under 20 minutes with these Nutella brownies. ", :user_id =>  2 )
r.ingredients.build(name: "Egg")
r.ingredients.build(name: "Nutella")
r.steps.ingredients(name: "Flour")
r.steps.build(step: "2 eggs,   2/3 cup Nutella,  2/3 cup flour")
r.steps.build(step: "Mix the eggs, Nutella and flour in a large bowl.")
r.steps.build(step: "Spray the pan with cooking spray, then evenly spread the mixture.")
r.save

r = Recipe.new(:title => "Five-Spice Tilapia", :description => "People with celiac disease or gluten-sensitivity should use soy sauces that are labeled gluten-free, as soy sauce may contain wheat or other gluten-containing sweeteners and flavors.", :user_id =>  2 )
r.ingredients.build(name: "Brown Sugar")
r.ingredients.build(name: "Canola Oil")
r.ingredients.build(name: "Scallions")
r.steps.build(step: "Sauce3 tablespoons light brown sugar,  1 tablespoon canola oil Mazola Pure Canola Oil 40 Fl, 3 scallions, thinly sliced")
r.steps.build(step: "Sprinkle both sides of tilapia fillets with five-spice powder. Combine soy sauce and brown sugar in a small bowl.")
r.steps.build(step: "Heat oil in a l  arge nonstick skillet over medium-high heat. ")
r.steps.build(step: " Add the tilapia and cook until the outer edges are opaque, about 2 minutes.")
r.steps.build(step: " Reduce heat to medium, turn the fish over, stir the soy mixture and pour into the pan. Bring the sauce to a boil and cook until the fish is cooked through and the sauce has thickened slightly, about 2 minutes more. ")
r.steps.build(step: " Add scallions and remove from the heat. Serve the fish drizzled with the pan sauce.")
r.save


r = Recipe.new(:title => "Chocolate Mug Cake", :description => "So the next time you’re craving something sweet and are short on time, you know what to make.", :user_id =>  2 )
r.ingredients.build(name: "Banana")
r.steps.build(step: "Strawberry")
r.steps.build(step: "Cocoa Powder")
r.steps.build(step: "1 very ripe banana,  20 strawberries,  2 tablespoon cocoa powder")
r.steps.build(step: "Grease a coffee mug to make it non-stick. Mix all ingredients in a bowl. Pour in mug.")
r.steps.build(step: "Microwave on high between 1-2 minutes depending on microwave wattage.")
r.save



c = Comment.new(:content => "Lorem ipsum dolor sit amet.",  :ratings => 5,  :recipe_id => 1, :user_id  => 1)
c.save
c = Comment.new(:content => "Lorem ipsum dolor sit amet, consectetur.",  :ratings => 5,   :recipe_id => 1, :user_id  => 2)
c.save
c = Comment.new(:content => "Lorem ipsum dolor sit amet, consectetur.",  :ratings => 4,    :recipe_id => 1, :user_id  => 1)
c.save
c = Comment.new(:content => "Lorem ipsum dolor sit amet, consectetur.",  :ratings => 3,    :recipe_id => 1, :user_id  => 2)
c.save
c = Comment.new(:content => "Lorem ipsum dolor sit amet, consectetur.",  :ratings => 3,    :recipe_id => 1, :user_id  => 4)
c.save
c = Comment.new(:content => "Lorem ipsum dolor sit amet, consectetur.",  :ratings => 2,    :recipe_id => 1, :user_id  => 5)
c.save
c = Comment.new(:content => "Lorem ipsum dolor sit amet, consectetur.",  :ratings => 5,    :recipe_id => 1, :user_id  => 5)
c.save
