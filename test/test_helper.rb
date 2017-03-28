# Minitest
require 'minitest/autorun'
require 'minitest/stub_any_instance'

# Helpers
require 'mock_test_helper'

module Kernel
  def puts(*args)
    args
  end
end
