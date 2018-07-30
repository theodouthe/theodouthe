class Recipe
  attr_reader :name, :description, :prep_time, :difficulty, :done

  def initialize(attributes)
    @name = attributes[:name]
    @description = attributes[:description]
    @prep_time = attributes[:prep_time]
    @difficulty = attributes[:difficulty] || 'Easy'
    @done = attributes[:done] || false
  end

  def mark_as_done
    @done = true
  end
end
