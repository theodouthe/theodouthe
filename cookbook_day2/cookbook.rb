require 'csv'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    # ici on vérifie si le fichier csv existe pour éviter une erreur
    load_csv if File.exist?(@csv_file_path)
  end

  def all
    @recipes
  end

  def add(recipe)
    @recipes << recipe
    save_csv
  end

  def remove(id)
    @recipes.delete_at(id)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      @recipes << Recipe.new(name: row[0], description: row[1])
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
