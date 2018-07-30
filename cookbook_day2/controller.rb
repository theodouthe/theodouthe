require 'nokogiri'
require 'pry-byebug'
require_relative 'scrapper'
require_relative 'recipe'

class Controller
  def initialize(cookbook, view)
    @cookbook = cookbook
    @view = view
  end

  def index
    display_recipes
  end

  def create
    # 1 - Ask user for name
    name = @view.ask_user_for('name')
    # 2 - Ask user for description
    description = @view.ask_user_for('description')
    # 3 - Creer une recette
    recipe = Recipe.new(name: name, description: description)
    # 4 - L'ajouter au cookbook
    @cookbook.add(recipe)

    display_recipes
  end

  def destroy
  end

  def import
    keyword = @view.ask_user_for('Keyword')
    recipes = Scrapper.new(keyword).call
    @view.display(recipes)
    id = @view.ask_for_id
    recipe = recipes[id]
    @cookbook.add(recipe)
    display_recipes
  end

  def mark_as_done
    #todo
  end

  private

  def display_recipes
    # 1 - demander au Cookbook les recettes
    recipes = @cookbook.all
    # 2 - demander a la vue de les afficher
    @view.display(recipes)
  end
end
