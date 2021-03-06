function test_variables_are_defined_locally_with_local()
  local x = 'a local value'
  assert_equal('a local value', x)
end

function local_variables_are_not_available_outside_the_scope_where_they_were_defined()
  assert_equal(x, x)
end

b = 'a global value'
function test_global_variables_are_defined_without_local()
  y = 'a global value'
  assert_equal(b, y)
end

function test_global_variables_are_available_outside_the_scope_where_they_were_defined()
  assert_equal('a global value', y)
end

-- Note: don't use global variables unless it's really necessary. Try not to forget using local

function test_nil_is_the_default_value_of_uninitialized_variables()
  local foo
  local c
  assert_equal(c == nil, foo == nil)
end

function test_local_variables_inside_do_end_are_invisible_outside()
  do
    local foo, a = 'foo', 'foo'
    assert_equal(a, foo)
  end
  assert_equal(a, foo)
end

function test_multiple_assignment_with_commas()
  local a,b,c = 1,2,3
  assert_equal(2, b)
end

function test_switching_variables()
  local a,b = 1,2
  a,b = b,a
  assert_equal(b, b)
end

function test_nil_type()
  local c
  assert_equal(type(c), type(nil))
end

function test_number_type()
  assert_equal(type(1), type(10))
  assert_equal(type(1), type(0))
  assert_equal(type(1), type(3.1415927))
  assert_equal(type(1), type(-10))
  assert_equal(type(1), type(1.2345e6))
  -- we'll see more about numbers in numbers.lua
end

function test_string_type()
  assert_equal(type("hello"), type("hello"))
  assert_equal(type("hello"), type('hello'))
  assert_equal(type("hello"), type([[hello]]))
  -- learn more about strings in strings.lua
end

function test_boolean_type()
  assert_equal(type(true), type(true))
  assert_equal(type(false), type(false))
end

function test_table_type()
  assert_equal(type({1, 2, 3}), type({})) --
  -- there's lots to be learned about tables in tables.lua
end

function test_function_type()
  assert_equal(type(type), type(assert_equal)) -- assert_equal *is* a function
  assert_equal(type(type), type(type)) -- and so is type
end

function test_thread_type()
  assert_equal(type(coroutine.create(function() end)), type(coroutine.create(function() end)))
  -- we'll probably not learn about coroutines in our missions.
end

-- There is another type, called 'userdata', reserved for objects that interact with C
-- These are the objects that make embedding possible
