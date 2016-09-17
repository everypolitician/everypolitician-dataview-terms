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

  it 'has CSV view' do
    assert_equal 'id,name', subject.terms.first.as_csv
  end
end
