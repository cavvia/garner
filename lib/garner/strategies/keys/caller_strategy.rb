module Garner
  module Strategies
    module Keys
      # Injects the caller's location into the key.
      module Caller
        class << self
        
          def field
            :caller
          end
          
          def apply(key, context = {})
            rc = key ? key.dup : {}
            clr = caller.detect { |line| ! line.end_with?("/#{File.basename(__FILE__)}") }
            rc[field] = clr if clr
            rc
          end
        end
      end
    end
  end
end
