require "./spec_helper"

describe Stack do
  describe OOStackUnlimited do
    stack = create_empty_stack

    after_each do
      stack = create_empty_stack
    end

    it "stack should empty when created" do
      stack.empty?.should be_true
    end

    it "push add elements to the stack" do
      stack.push "something"
      stack.empty?.should be_false
    end

    it "pop removes elements from the stack" do
      stack.push "something"
      stack.pop
      stack.empty?.should be_true
    end

    it "pop returns last pushed object" do
      pushed_object = "something"
      stack.push pushed_object
      stack.pop.should be pushed_object
    end

    it "stack behaves LIFO" do
      first_pushed_object = "first"
      second_pushed_object = "second"
      stack.push first_pushed_object
      stack.push second_pushed_object
      stack.pop.should be second_pushed_object
      stack.pop.should be first_pushed_object
      stack.empty?.should be_true
    end

    it "top returns last pushed object" do
      pushed_object = "somethig"
      stack.push pushed_object
      stack.top.should be pushed_object
    end

    it "top does not remove object from stack" do
      pushed_object = "something"
      stack.push pushed_object
      stack.size.should eq 1
      stack.top
      stack.size.should eq 1
    end

    it "can not pop when there are no objects in the stack" do
      expect_raises(Exception, OOStack.stack_empty_error_description) do
        stack.pop
      end
    end

    it "can not pop when there are no objects in the stack and the stack had objects" do
      stack.push "something"
      stack.pop
      expect_raises(Exception, OOStack.stack_empty_error_description) do
        stack.pop
      end
    end

    it "can not top when there are no objects in the stack" do
      expect_raises(Exception, OOStack.stack_empty_error_description) do
        stack.top
      end
    end
  end

  describe SentenceFinderByPrefix do
    it "returns array with matching sentence" do
      matching_sentence = "Winter is coming"
      prefix = "Win"
      stack = create_stack_with matching_sentence
      founded = find_in stack, prefix
      founded.includes?(matching_sentence).should be_true
    end

    it "returns array with sentence if it starts with prefix" do
      unmatching_sentence = "The Winter is coming"
      prefix = "Win"
      stack = create_stack_with unmatching_sentence
      founded = find_in stack, prefix
      founded.includes?(unmatching_sentence).should be_false
    end

    it "sentences keeps stacked" do
      first = "Winter"
      second = "is"
      third = "coming"
      prefix = "Win"
      stack = create_stack_with first, second, third
      find_in stack, prefix
      stack.pop.should be third
      stack.pop.should be second
      stack.pop.should be first
    end

    context "Invalid prefix" do
      it "prefix can't be empty" do
        empty_prefix = ""
        stack = create_empty_stack
        expect_raises(Exception, invalid_prefix_error_description) do
          find_in(stack, empty_prefix)
        end
      end

      it "prefix can't be a space" do
        spaced_prefix = " "
        stack = create_empty_stack
        expect_raises(Exception, invalid_prefix_error_description) do
          find_in(stack, spaced_prefix)
        end
      end

      it "prefix can't contain space between characters" do
        spaced_prefix = "the winter"
        stack = create_empty_stack
        expect_raises(Exception, invalid_prefix_error_description) do
          find_in(stack, spaced_prefix)
        end
      end
    end
  end

  describe OOStackLimited do
    it "empty limited stack is not full" do
      stack = create_empty_limited_stack_up_to 1
      stack.full?.should be_false
    end

    it "limited stack is full when limit is reached" do
      stack = create_empty_limited_stack_up_to 1
      stack.push "something"
      stack.full?.should be_true
    end

    it "limited stack is not full until limit is reached" do
      stack = create_empty_limited_stack_up_to 2
      stack.push "something"
      stack.full?.should be_false
      stack.push "anything"
      stack.full?.should be_true
    end

    it "can not push when limit was reached" do
      stack = create_empty_limited_stack_up_to 1
      stack.push "something"
      expect_raises(Exception, limit_reached_error_description) do
        stack.push "oops"
      end
    end

    it "can not create stack with limit under 1" do
      expect_raises(Exception, invalid_limit_error_description) do
        create_empty_limited_stack_up_to 0
      end
    end
  end
end
