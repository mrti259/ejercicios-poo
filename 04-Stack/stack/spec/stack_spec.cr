require "./spec_helper"

describe Stack do
  stack = create_stack

  after_each do
    stack = create_stack
  end

  it "stack should empty whe created" do
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
