require_relative 'tracker'    
require_relative 'controller' 
require_relative 'router'

csv_file   = File.join(__dir__, 'contacts.csv')
tracker   = Tracker.new(csv_file)
controller = Controller.new(tracker)

router = Router.new(controller)

# Start the app
router.run