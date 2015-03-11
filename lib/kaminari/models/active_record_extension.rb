require 'kaminari/models/active_record_model_extension'

module Kaminari
  module ActiveRecordExtension
    # Future subclasses will pick up the model extension
    def inherited(kls)
      super
      kls.send(:include, Kaminari::ActiveRecordModelExtension) if kls.superclass == ::ActiveRecord::Base
    end

    def self.extended(mod)
      # Existing subclasses pick up the model extension as well
      mod.descendants.each do |kls|
        kls.send(:include, Kaminari::ActiveRecordModelExtension) if kls.superclass == ::ActiveRecord::Base
      end
    end
  end
end
