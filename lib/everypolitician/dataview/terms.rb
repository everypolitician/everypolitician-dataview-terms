module Everypolitician
  module Dataview
    class Terms
      def initialize(popolo:)
        @popolo = popolo
      end

      def terms
        popolo.terms
      end

      private

      attr_reader :popolo
    end
  end
end
