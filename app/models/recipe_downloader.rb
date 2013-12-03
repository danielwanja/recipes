# Downloading from http://dsquirrel.tripod.com/recipeml/indexrecipes2.html
require 'open-uri'
require 'zip'

class RecipeDownloader
  # Tiffanys-Pumpkin-Cupcake
  BASE_URL = "http://dsquirrel.tripod.com/xmlzips/RecipeMLArchive{1}.zip"

  def parse_all(user)
    @user = user
    110.times do |i|
      filenumber = (i+1).to_s.rjust(5, '0')
      url = BASE_URL.sub("{1}", filenumber)
      parse_file url
    end
  end

  def parse_file(zipfilename)
    puts "Loading #{zipfilename}"
    Zip::InputStream.open(open(zipfilename)) do |zis|
      while entry = zis.get_next_entry do
        parse_zip_entry(entry, zis.read)
      end
    end
  end

  def parse_zip_entry(entry, content)
      name = entry.name[4..-5] # i.e "xml/#10_Cake.xml"
      puts "Name: #{name}"
      xml = Hash.from_xml(content)

      # recipe
      recipe = xml["recipeml"]["recipe"]
      title = recipe["head"]["title"]
      image_url = get_image_url(title||name)
      categories = Array.wrap(recipe["head"]["categories"]["cat"]).join(', ')
      steps = recipe["directions"]["step"]
      ingredients = recipe["ingredients"]

      new_recipe = @user.recipes.create(title: title.to_s[0..254],
                                        description: nil,
                                        image_url: image_url&&image_url.length<255 ? image_url : nil,
                                        tag_list: categories&&categories.length<255 ? categories : nil)

      # steps
      if steps.nil?
        puts "\tno steps"
      elsif steps.is_a?(String)
        puts "\tSteps:#{}"
        new_recipe.steps.create(position:1,   description: steps.to_s[0..254] )
      else
        #Anything else out there?
        puts "\tSteps:#{steps.class} !!!!!"
      end

      # intgredients
      if ingredients.nil?
        puts "\tno ingredients"
      elsif ingredients["ing_div"].is_a?(Hash)
        puts "\tSingle"
        ingredient_group = ingredients['ing_div']
        title = ingredient_group['title']
        ingredient_entries = ingredient_group['ing']
        add_ingredients(new_recipe, ingredient_entries, title)
      elsif ingredients["ing_div"].is_a?(Array)
        puts "\tComplex"
        ingredients["ing_div"].each do |ingredient_group|
          title = ingredient_group['title']
          ingredient_entries = ingredient_group['ing'] # array of {"amt"=>{"qty"=>"50", "unit"=>nil}, "item"=>"MILK SKIM FILLED 1/2 PT"}
          add_ingredients(new_recipe, ingredient_entries, title)
        end
      else
        ingredient_entries = ingredients["ing"]
        add_ingredients(new_recipe, ingredient_entries)
      end
  end

  def add_ingredients(recipe, ingredients, title=nil)
    return unless ingredients
    puts "\tIngredients #{title}=>#{ingredients.length}"
    recipe.ingredients.create(amount: nil, description: title ) if title  # FIXME: Adding a title in between ingredients...maybe we should adapt the model (recipe has one or more parts that each have many ingredients?)
    Array.wrap(ingredients).each do |ingredient|
      recipe.ingredients.create(amount: ingredient["amt"]["qty"], unit: ingredient["amt"]["unit"], description: ingredient["item"] )
    end
  end

  def get_image_url(name)
    name = name.gsub(/[^A-Za-z0-9]/, " ")
    images = Google::Search::Image.new(:query => name, imgsz: "small")
    images.first.uri if images.first
  end
end