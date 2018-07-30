require_relative 'router'
require_relative 'controller'
require_relative 'cookbook'
require_relative 'view'

view = View.new
cookbook = Cookbook.new('recipes.csv')
controller = Controller.new(cookbook, view)
router = Router.new(controller)

router.start
