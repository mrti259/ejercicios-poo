require "spec"
require "../src/stack"

include Stack

def create_empty_stack
  OOStackUnlimited(String).empty
end

def create_stack_with(*sentences : String)
  stack = create_empty_stack
  sentences.each { |sentence| stack.push sentence }
  stack
end

def find_in(stack : OOStack, prefix : String)
  SentenceFinderByPrefix.find_in(stack, prefix)
end

def invalid_prefix_error_description
  SentenceFinderByPrefix.invalid_prefix_error_description
end

def create_empty_limited_stack_up_to(limit : Int32)
  OOStackLimited(String).upto limit
end

def limit_reached_error_description
  OOStackLimited.limit_reached_error_description
end

def invalid_limit_error_description
  OOStackLimited.invalid_limit_error_description
end
