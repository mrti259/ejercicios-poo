require "./spec_helper"

describe Numeros do
  # Enteros
  zero = Entero.with 0
  one = Entero.with 1
  two = Entero.with 2
  three = Entero.with 3
  four = Entero.with 4
  five = Entero.with 5
  eight = Entero.with 8
  negative_one = Entero.with -1
  negative_two = Entero.with -2
  # Fracciones
  one_half = one / two
  one_fifth = one / five
  two_fifth = two / five
  six_fifth = Entero.with(6) / five
  two_twentyfifth = two / Entero.with 25
  five_halfs = five / two

  it "zero? returns true when ask to zero" do
    zero.zero?.should be_true
  end

  it "zero? returns false when ask to others but zero" do
    one.zero?.should be_false
  end

  it "one? returns true when ask to one" do
    one.one?.should be_true
  end

  it "one? returns false when ask to other than one" do
    zero.one?.should be_false
  end

  it "entero adds with entero correctly" do
    (one + one).should eq two
  end

  it "entero multiplies with entero correctly" do
    (two * two).should eq four
  end

  it "entero divides entero correctly" do
    (two / two).should eq one
  end

  it "fraccion adds with fraccion correctly" do
    seven_tenths = Entero.with(7) / Entero.with(10)
    (one_fifth + one_half).should eq seven_tenths
  end

  it "fraccion multiplies with fraccion correctly" do
    (one_fifth * two_fifth).should eq two_twentyfifth
  end

  it "fraccion divides fraccion correctly" do
    (one_half / one_fifth).should eq five_halfs
  end

  it "entero adds fraccion correctly" do
    (one + one_fifth).should eq(six_fifth)
  end

  it "fraccion adds entero correctly" do
    (one_fifth + one).should eq(six_fifth)
  end

  it "entero multiplies fraccion correctly" do
    (two * one_fifth).should eq two_fifth
  end

  it "fraccion multiplies entero correctly" do
    (one_fifth * two).should eq two_fifth
  end

  it "entero divides fraccion correctly" do
    (one / two_fifth).should eq five_halfs
  end

  it "fraccion divides entero correctly" do
    (two_fifth / five).should eq two_twentyfifth
  end

  it "fraccion can be equal to an entero" do
    two.should eq four / two
  end

  it "aparent fracciones are equals" do
    one_half.should eq two / four
  end

  it "adding fracciones can return an entero" do
    (one_half + one_half).should eq one
  end

  it "multiplying fracciones can return an entero" do
    (two_fifth * five_halfs).should eq one
  end

  it "dividing fracciones can return an entero" do
    (one_half / one_half).should eq one
  end

  it "dividing enteros can return a fraccion" do
    (two/four).should eq one_half
  end

  it "can not divide entero by zero" do
    expect_raises(Exception, Numero.can_not_divide_by_zero_error_description) do
      one / zero
    end
  end

  it "can not divide fraccion by zero" do
    expect_raises(Exception, Numero.can_not_divide_by_zero_error_description) do
      one_half / zero
    end
  end

  it "fracciones can not be zero" do
    one_half.zero?.should be_false
  end

  it "fraccion can not be one" do
    one_half.one?.should be_false
  end

  it "entero subtracts entero correctly" do
    (three - one).should eq two
  end

  it "fraccion subtracts fraccion correctly" do
    (two_fifth - one_fifth).should eq one_fifth
  end

  it "entero subtracts fraccion correctly" do
    (one - one_half).should eq one_half
  end

  it "fraccion subtracts entero correctly" do
    six_fifth = Entero.with(6) / five
    (six_fifth - one).should eq one_fifth
  end

  it "subtracting fracciones can return an entero" do
    three_halfs = three / two
    (three_halfs - one_half).should eq one
  end

  it "substracting same enteros returns zero" do
    (one - one).should eq zero
  end

  it "subtracting same fracciones returns zero" do
    (one_half - one_half).should eq zero
  end

  it "subtracting a higher value to a number returns a negative number" do
    negative_three_halfs = Entero.with(-3) / two
    (one - five_halfs).should eq negative_three_halfs
  end

  it "fibonacci zero is one" do
    zero.fibonacci.should eq one
  end

  it "fibonacci one is one" do
    one.fibonacci.should eq one
  end

  it "fibonacci entero returns adding previous two fibonacci enteros" do
    four.fibonacci.should eq five
    three.fibonacci.should eq three
    five.fibonacci.should eq(four.fibonacci + three.fibonacci)
  end

  it "fibonacci not defined for negative numbers" do
    expect_raises(Exception, Entero.negative_fibonacci_error_description) do
      negative_one.fibonacci
    end
  end

  it "negation of entero is correct" do
    two.negated.should eq negative_two
  end

  it "negation of fraccion is correct" do
    one_half.negated.should eq negative_one / two
  end

  it "sign is correctly assigned to fraccion with two negatives" do
    (negative_one / negative_two).should eq one_half
  end

  it "sign is correctly assigned to fraccion with negative divisor" do
    (one / negative_two).should eq one_half.negated
  end
end
