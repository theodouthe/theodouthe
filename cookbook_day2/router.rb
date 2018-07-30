class Router
  def initialize(controller)
    @controller = controller
  end

  def start
    loop do
      print_menu
      action = get_action
      route(action)
    end
  end

  private

  def print_menu
    puts "1 - List Recipes"
    puts "2 - Add a recipe"
    puts "3 - Destroy a recipe"
    puts '4 - Get a recipe from the web'
    puts "0 - Exit"
  end

  def get_action
    gets.chomp.to_i
  end

  def route(action)
    case action
    when 1 then @controller.index
    when 2 then @controller.create
    when 3 then @controller.destroy
    when 4 then @controller.import
    when 0
      puts "BYE BYE"
      exit
    else puts "Pas compris"
    end
  end
end
