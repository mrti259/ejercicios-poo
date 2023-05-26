require "spec"
require "../src/stack"

include Stack

def create_empty_stack
  OOStack(String).new
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
