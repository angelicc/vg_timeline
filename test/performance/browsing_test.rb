require 'test_helper'
<<<<<<< HEAD
require 'rails/performance_test_help'
=======
require 'performance_test_help'
>>>>>>> 1a2077b7618653b1f5191387be40b27de1a3d757

# Profiling results for each test method are written to tmp/performance.
class BrowsingTest < ActionController::PerformanceTest
  def test_homepage
    get '/'
  end
end
