require 'test_helper'

class AnyEnums::Assign::Test < ActiveSupport::TestCase
  test "any_enums_define_on_Engineer" do
    actual = Engineer.fields
    expected = {
      "server" => 1,
      "front" => 2,
      "infra" => 3,
      "server_or_front" => 110,
      "server_or_infra" => 111,
      "front_or_infra" => 118,
      "server_or_front_or_infra" => 182
    }
    assert_equal expected, actual
  end

  test "assign_enums_2_values_on_Engineer" do
    sam = Engineer.server_or_front.new
    assert_equal "server_or_front", sam.field
    assert_equal ["server", "front"], sam.fields
    assert_equal [1, 2], sam.fields_before_type_cast
  end
end
