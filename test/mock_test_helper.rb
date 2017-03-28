# Prepares mock for given method of given object (or class) and yields to given block.
# Given method is expected to be called with given arguments.
# Mock will return the result of really making this call, allowing the program to continue normally.
#
# Example testing correct instantiation of a query:
#
# expect_call(MyQuery, :new, { filter: '123' }) do
#   get '/my/url'
# end

def expect_call(object, method, *expected_args, &block)
  mock = MiniTest::Mock.new
  mock.expect(method, object.send(method, *expected_args), expected_args)
  object.stub(method, -> (*args) { mock.send(method, *args) }) do
    block.call
  end
  mock.verify
end
