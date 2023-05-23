require "spec"
require "../src/codigo-repetido"

def create_customer_book
  CustomerBook.new
end

def create_customer_book_with_customer(name : String)
  create_customer_book.add_customer_named name
end

def assert_takes_less_than(max_time : Time::Span, &action_to_measure)
  time_spent = Time.measure do
    yield
  end
  time_spent.should be < max_time
end

def assert_customer_book_has_number_of_active_and_number_of_suspended(
  customer_book : CustomerBook,
  number_of_active : Int,
  number_of_suspended : Int
)
  customer_book.number_of_active_customers.should eq number_of_active
  customer_book.number_of_suspended_customers.should eq number_of_suspended
  customer_book.number_of_customers.should eq number_of_active + number_of_suspended
end

def raises_exception_when_customer_book_has_customer(
  exception : Exception.class,
  customer_book : CustomerBook,
  customer_name : String,
  &action_to_raise_exception
)
  expect_raises(exception) do
    yield
  end

  customer_book.number_of_customers.should eq 1
  customer_book.includes_customer_named?(customer_name).should be_true
end

def assert_cant_suspend_when_customer_book_has_customer(
  customer_book : CustomerBook,
  customer_name : String,
  &action_to_raise_exception
)
  raises_exception_when_customer_book_has_customer(CantSuspend, customer_book, customer_name) do
    yield
  end
end
