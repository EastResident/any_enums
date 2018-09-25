module AnyEnums
  module Assign
    extend ActiveSupport::Concern
    included do
    end
    CACHE = ActiveSupport::Cache::MemoryStore.new
    class_methods do
      def any_enums(options)
        options.each do |k, v|
          enums = {}
          max = v.size
          (2..max).each do |n|
            v.to_a.combination(n) do |c|
              h = c.to_h
              enums.merge!(h.keys.join('_or_') => hash_table[h.values.sort])
            end
          end
          enum k => v.merge(enums)
          split_enums k
        end
      end

      private

      def hash_table
        CACHE.fetch('any_enums_hash_table') do
          table = {}
          index = 101
          (2..10).each do |n|
            (0..9).to_a.combination(n) do |v|
              table.merge!( v => index)
              index += 1
            end
          end
          table
        end
      end

      def split_enums(key)
        define_enums(key) do |values, enums|
          values & enums.keys
        end
        define_enums(key, suffix: '_before_type_cast') do |values, enums|
          values.reduce([]) { |a, e| a << enums[e] }
        end
      end

      def define_enums(key, suffix: nil)
        define_method(key.to_s.pluralize + suffix.to_s) do
          value = send(key.to_s)
          enums = self.class.send(key.to_s.pluralize)
          value unless value.include?('_or_')
          values = value.split('_or_')
          yield(values, enums)
        end
      end
    end
  end
end
