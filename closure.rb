

test = Proc.new {will_i_run?}

def test_method(pr)
    pr.call
end

def will_i_run?
    puts 'yes'
end

test_method(test)



def call_me(some_code)
    some_code.call            # call will execute the "chunk of code" that gets passed in
  end
  
  
  chunk_of_code = Proc.new {puts "hi #{name}"}
  name = "Robert"
  
  call_me(chunk_of_code)