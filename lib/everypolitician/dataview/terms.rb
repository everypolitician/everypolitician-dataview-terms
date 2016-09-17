module Everypolitician
  module Dataview
    class Terms
      def initialize(popolo:)
        @popolo = popolo
      end

      def terms
        popolo.terms.map { |t| Term.new(t) }
      end

      private

      attr_reader :popolo
    end

    class Term
      def initialize(t)
        @term = t
      end

      def as_csv
        'id,name'
      end

      private

      attr_reader :term
    end
  end
end
