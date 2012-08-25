# encoding: utf-8
module Mongoid #:nodoc:
  module Fields #:nodoc:
    module Internal #:nodoc:
      # Defines the behaviour for binary fields.
      class Binary
        include Serializable
      end
    end
  end
end
