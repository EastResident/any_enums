require 'test_helper'

class AnyEnums::KeySearcher::Test < ActiveSupport::TestCase
  test "assign_enums_2_values_on_Engineer_and_allow_switch" do
    sam = Engineer.front_or_server.new
    assert_equal "server_or_front", sam.field
    assert_equal ["server", "front"], sam.fields
  end
end
