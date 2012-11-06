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

  it 'retrieves state data' do
    country.should have(27).states
    rio = country.state('RJ')
    rio.name.should == 'Rio de Janeiro'
    rio.acronym.should == 'RJ'
    rio.region.should == 'Sudeste'
  end
end
