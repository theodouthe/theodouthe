class View
  def display(recipes)
    puts "=" * 15
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name}"
    end
    puts "=" * 15
  end

  def ask_user_for(stuff)
    puts "Give #{stuff} ?"
    gets.chomp
  end

  def ask_for_id
    puts "Give me an id ?"
    gets.to_i - 1
  end
end
