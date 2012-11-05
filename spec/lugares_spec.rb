require 'spec_helper'

describe Places::Country do
  class Country
    include Places::Country
  end

  let(:country) { Country.load_country('brazil') }

  it 'gets a country by name' do
    country.should be_kind_of Country
    country.name.should == 'Brasil'
    country.international_name.should == 'Brazil'
    country.demonym.should == 'brasileiro'
    country.female_demonym.should == 'brasileira'
    country.international_demonym.should == 'Brazilian'
  end
end
