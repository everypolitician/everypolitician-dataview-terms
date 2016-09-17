require 'test_helper'

describe 'Pitcairn' do
  subject do
    Everypolitician::Dataview::Terms.new(
      popolo: EveryPolitician::Popolo.read('test/fixtures/pitcairn.json')
    )
  end

  it 'has 3 terms' do
    assert_equal 3, subject.terms.count
  end

  it 'has an ID for each term' do
    assert_equal '2009', subject.terms.first.id
    assert_equal '2013', subject.terms.last.id
  end

  it 'has CSV view' do
    subject.terms.each do |t|
      assert_equal File.read("test/fixtures/pitcairn-#{t.id}.csv"), t.as_csv
    end
  end
end
