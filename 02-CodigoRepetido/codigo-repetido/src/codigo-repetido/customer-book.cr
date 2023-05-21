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

    protected def with_self(&) : self
      yield
      self
    end

    protected def signal(message : String)
      raise Exception.new message
    end

    def add_customer_named(aName : String) : self
      with_self do
        signal self.class.customer_already_exists_error_message if includes_customer_named? aName

        signal self.class.customer_can_not_be_empty_error_message if aName.empty?

        @active_customers << aName
      end
    end

    protected def remove_from_collection_if_absent(
      aCollection : Array(String),
      anElementToBeRemoved : String,
      &doIfAbsent
    )
      if aCollection.includes? anElementToBeRemoved
        aCollection.delete anElementToBeRemoved
      else
        yield
      end
    end

    def suspend_customer_named(aName : String) : self
      with_self do
        remove_from_collection_if_absent(@active_customers, aName) do
          raise CantSuspend.new unless @active_customers.includes? aName
        end

        @suspended_customers << aName
      end
    end

    def remove_customer_named(aName : String) : self
      with_self do
        remove_from_collection_if_absent(@active_customers, aName) do
          remove_from_collection_if_absent(@suspended_customers, aName) do
            raise NotFound.new
          end
        end
      end
    end

    def empty? : Bool
      @active_customers.empty? || @suspended_customers.empty?
    end

    def includes_customer_named?(aName : String) : Bool
      @active_customers.includes?(aName) || @suspended_customers.includes?(aName)
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
