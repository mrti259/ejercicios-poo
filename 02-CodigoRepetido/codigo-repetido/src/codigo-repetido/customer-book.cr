module Codigo::Repetido
  class CustomerBook
    def self.customer_can_not_be_empty_error_message : String
      "Customer Name Cannot Be Empty"
    end

    def self.customer_already_exists_error_message : String
      "Customer Already Exists"
    end

    @active_customers = Array(String).new
    @suspended_customers = Array(String).new

    private def signal(message : String) : NoReturn
      raise Exception.new message
    end

    def add_customer_named(name : String) : Nil
      signal self.class.customer_already_exists_error_message if includes_customer_named? name

      signal self.class.customer_can_not_be_empty_error_message if name.empty?

      @active_customers << name
    end

    private def remove_from_collection_if_absent(
      colection : Array(String),
      element_to_be_removed : String,
      &do_if_absent
    ) : Nil
      if colection.includes? element_to_be_removed
        colection.delete element_to_be_removed
      else
        yield
      end
    end

    def suspend_customer_named(name : String) : Nil
      remove_from_collection_if_absent(@active_customers, name) do
        raise CantSuspend.new unless @active_customers.includes? name
      end

      @suspended_customers << name
    end

    def remove_customer_named(name : String) : Nil
      remove_from_collection_if_absent(@active_customers, name) do
        remove_from_collection_if_absent(@suspended_customers, name) do
          raise NotFound.new
        end
      end
    end

    def empty? : Bool
      @active_customers.empty? || @suspended_customers.empty?
    end

    def includes_customer_named?(name : String) : Bool
      @active_customers.includes?(name) || @suspended_customers.includes?(name)
    end

    def number_of_customers : Int
      number_of_active_customers + number_of_suspended_customers
    end

    def number_of_active_customers : Int
      @active_customers.size
    end

    def number_of_suspended_customers : Int
      @suspended_customers.size
    end
  end
end
