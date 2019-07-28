assert_equals(false, !value.odd?)

assert_equals('xyz', value.downcase)

assert_nil(value)

assert_empty(list)

assrt_includes(list, 'xyz')

assert_raises(NoExperienceError) {employee.hire}

assert_match(Numeric, value.class)

assert_kind_of(Numeric, value)

assert_equals(list.object_id, list.proces.object_id) # OR
assert_same(list, list.process)

refute_includes(list, 'xyz')
