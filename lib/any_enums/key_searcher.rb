module AnyEnums
  module KeySearcher
    extend ActiveSupport::Concern
    class_methods do
      def method_missing(name, *args)
        keys = name.to_s.split('_or_')
        if keys.all? { |k| self.respond_to?(k) }
          keys.permutation do |key|
            valid_name = key.join('_or_')
            return self.send(valid_name) if self.respond_to?(valid_name)
          end
        else
          super
        end
      end
    end
  end
end
