require 'csv'

module Enumerable
  # Workaround for native sort_by producing inconsistent results between OS X
  # and Linux.
  # @see https://bugs.ruby-lang.org/issues/11379
  def portable_sort_by(&block)
    group_by(&block).sort_by { |group_name, _| group_name }.flat_map { |_, group| group }
  end
end

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
        sorted = data.portable_sort_by do |r|
          [r[:name], r[:id], r[:start_date].to_s, r[:area].to_s]
        end
        rows = sorted.map { |r| r.values.to_csv }
        [header, rows].compact.join
      end

      def id
        term.id.split('/').last
      end

      private

      attr_reader :term

      def header
        data.first.keys.to_csv
      end

      def data
        @data ||= term_memberships.map do |m|
          person = people[m.person_id].first
          group  = orgs[m.on_behalf_of_id].first
          house  = orgs[m.organization_id].first

          {
            id:         person.id.split('/').last,
            name:       person.name_at(m.end_date || term.end_date),
            sort_name:  person.sort_name,
            email:      person.email,
            twitter:    person.twitter,
            facebook:   person.facebook && person.facebook.sub('https://facebook.com/', ''),
            group:      group.name,
            group_id:   group.id.split('/').last,
            area_id:    m.area_id,
            area:       m.area_id && areas[m.area_id].first.name,
            chamber:    house.name,
            term:       id,
            start_date: m.start_date,
            end_date:   m.end_date,
            image:      person.image,
            gender:     person.gender,
          }
        end
      end

      def popolo
        term.popolo
      end

      def term_memberships
        @tmems ||= popolo.memberships.where(legislative_period_id: term.id)
      end

      # For quicker lookup. TODO: use fast EP::Popolo searches
      def people
        @people ||= popolo.persons.group_by(&:id)
      end

      def orgs
        @orgs ||= popolo.organizations.group_by(&:id)
      end

      def areas
        @areas ||= popolo.areas.group_by(&:id)
      end
    end
  end
end
