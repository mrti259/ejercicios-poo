require "./spec_helper"

include Codigo::Repetido

describe Codigo::Repetido do
  john_lennon = "John Lennon"
  paul_mccartney = "Paul McCartney"
  ringo_starr = "Ringo Starr"

  it "adding customer should not take more than 50 milliseconds" do
    customer_book = create_customer_book

    assert_takes_less_than 50.milliseconds do
      customer_book.add_customer_named john_lennon
    end
  end

  it "removing customers should not take more than 100 milliseconds" do
    customer_book = create_customer_book_with_customer paul_mccartney

    assert_takes_less_than 100.milliseconds do
      customer_book.remove_customer_named paul_mccartney
    end
  end

  it "can not add a customer with empty name" do
    customer_book = create_customer_book

    expect_raises(Exception, CustomerBook.customer_can_not_be_empty_error_message) do
      customer_book.add_customer_named ""
    end

    customer_book.empty?.should be_true
  end
  it "can not remove an invalid customer" do
    customer_book = create_customer_book_with_customer john_lennon

    raises_exception_when_customer_book_has_customer(NotFound, customer_book, john_lennon) do
      customer_book.remove_customer_named paul_mccartney
    end
  end

  it "suspending a customer should not remove it from customer book" do
    customer_book = create_customer_book_with_customer paul_mccartney
    customer_book.suspend_customer_named paul_mccartney

    assert_customer_book_has_number_of_active_and_number_of_suspended(customer_book, 0, 1)
    customer_book.includes_customer_named?(paul_mccartney).should be_true
  end

  it "removing a suspended customer should remove it from customer book" do
    customer_book = create_customer_book_with_customer paul_mccartney
    customer_book.suspend_customer_named paul_mccartney
    customer_book.remove_customer_named paul_mccartney

    assert_customer_book_has_number_of_active_and_number_of_suspended(customer_book, 0, 0)
    customer_book.includes_customer_named?(paul_mccartney).should be_false
  end

  it "can not suspend an invalid customer" do
    customer_book = create_customer_book_with_customer john_lennon

    assert_cant_suspend_when_customer_book_has_customer(customer_book, john_lennon) do
      customer_book.suspend_customer_named ringo_starr
    end
  end

  it "can not suspend an already suspended customer" do
    customer_book = create_customer_book_with_customer john_lennon
    customer_book.suspend_customer_named john_lennon

    assert_cant_suspend_when_customer_book_has_customer(customer_book, john_lennon) do
      customer_book.suspend_customer_named john_lennon
    end
  end
end
